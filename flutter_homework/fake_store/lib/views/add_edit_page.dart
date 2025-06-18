// lib/features/products/views/add_edit_page.dart
import 'package:fake_store/models/product_manager.dart';
import 'package:fake_store/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import '../models/product_model.dart';

/// A page for adding or editing a product, using ProductForm widget.
class AddEditPage extends StatefulWidget {
  final Product? product;
  const AddEditPage({Key? key, this.product}) : super(key: key);

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _priceController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imagesController;
  List<Category> _categories = [];
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _titleController = TextEditingController(text: p?.title ?? '');
    _priceController = TextEditingController(text: p?.price.toString() ?? '');
    _descriptionController = TextEditingController(text: p?.description ?? '');
    _imagesController = TextEditingController(
      text: p != null ? p.images.join(',') : '',
    );
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final cats = await ProductManager.instance.getCategories();
      setState(() {
        _categories = cats;
        _selectedCategory =
            widget.product != null
                ? cats.firstWhere(
                  (c) => c.id == widget.product!.category.id,
                  orElse: () => cats.first,
                )
                : cats.first;
      });
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load categories')),
      );
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    final product = Product(
      id: widget.product?.id,
      title: _titleController.text,
      slug: _titleController.text.toLowerCase().replaceAll(' ', '-'),
      price: int.tryParse(_priceController.text) ?? 0,
      description: _descriptionController.text,
      category: _selectedCategory!,
      images:
          _imagesController.text
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList(),
    );
    final cubit = context.read<ProductCubit>();
    if (widget.product == null) {
      cubit.addProduct(product);
    } else {
      cubit.editProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Product' : 'Add Product')),
      body: BlocListener<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductsLoaded) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(isEdit ? 'Product updated!' : 'Product added!'),
              ),
            );
          } else if (state is ProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        child:
            _categories.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ProductForm(
                  formKey: _formKey,
                  titleController: _titleController,
                  priceController: _priceController,
                  descriptionController: _descriptionController,
                  imagesController: _imagesController,
                  categories: _categories,
                  selectedCategory: _selectedCategory,
                  onCategoryChanged:
                      (val) => setState(() => _selectedCategory = val),
                  onSave: _onSave,
                  isEdit: isEdit,
                ),
      ),
    );
  }
}
