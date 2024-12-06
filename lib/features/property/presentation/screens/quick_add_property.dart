import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/property.dart';

class QuickAddProperty extends HookConsumerWidget {
  const QuickAddProperty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Name Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Property Name',
                prefixIcon: Icon(Icons.home),
              ),
              textInputAction: TextInputAction.next,
              autofocus: true,
            ),
            
            const SizedBox(height: 16),
            
            // Address Field with Map Integration
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_on),
              ),
              maxLines: 2,
            ),
            
            const SizedBox(height: 16),
            
            // Property Type Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Property Type',
                prefixIcon: Icon(Icons.category),
              ),
              items: const [
                DropdownMenuItem(value: 'HOUSE', child: Text('House')),
                DropdownMenuItem(value: 'APARTMENT', child: Text('Apartment')),
                DropdownMenuItem(value: 'COMMERCIAL', child: Text('Commercial')),
              ],
              onChanged: (value) {},
            ),
            
            const SizedBox(height: 16),
            
            // Rent Amount
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Monthly Rent',
                prefixIcon: Icon(Icons.currency_rupee),
              ),
              keyboardType: TextInputType.number,
            ),
            
            const SizedBox(height: 16),
            
            // Quick Photo Upload
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Photos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo),
                            label: const Text('Take Photo'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_library),
                            label: const Text('Choose Photos'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                // Save property and navigate back
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Save Property'),
          ),
        ),
      ),
    );
  }
}
