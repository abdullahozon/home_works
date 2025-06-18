import 'package:flutter/material.dart';
import '../../models/product_model.dart';

/// A form widget for adding or editing a product.
class ProductForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController imagesController;
  final List<Category> categories;
  final Category? selectedCategory;
  final ValueChanged<Category?> onCategoryChanged;
  final VoidCallback onSave;
  final bool isEdit;

  const ProductForm({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.imagesController,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.onSave,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            validator:
                (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            validator:
                (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator:
                (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: imagesController,
            decoration: const InputDecoration(
              labelText: 'Images (comma separated URLs)',
            ),
            validator:
                (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<Category>(
            value: selectedCategory,
            items:
                categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                    .toList(),
            onChanged: onCategoryChanged,
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSave,
            child: Text(isEdit ? 'Update Product' : 'Add Product'),
          ),
        ],
      ),
    );
  }
}
