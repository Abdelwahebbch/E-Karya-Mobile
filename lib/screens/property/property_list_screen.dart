import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/property_provider.dart';
import '../../constants/app_colors.dart';
import '../../widgets/property_card.dart';
import 'property_detail_screen.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({Key? key}) : super(key: key);

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  late TextEditingController _searchController;
  String? _selectedCity;
  double? _minPrice;
  double? _maxPrice;
  String? _selectedPropertyType;
  String? _selectedRentalType;
  int? _selectedBedrooms;
  int? _selectedBathrooms;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadProperties();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadProperties() {
    final propertyProvider = Provider.of<PropertyProvider>(context , listen: false);
    propertyProvider.getProperties(
      city: _selectedCity,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      propertyType: _selectedPropertyType,
      rentalType: _selectedRentalType,
      bedrooms: _selectedBedrooms,
      bathrooms: _selectedBathrooms,
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Price Range
                const Text(
                  'Price Range',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Min',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _minPrice = double.tryParse(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Max',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _maxPrice = double.tryParse(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Property Type
                const Text(
                  'Property Type',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ['Apartment', 'House', 'Studio', 'Condo']
                      .map((type) => FilterChip(
                            label: Text(type),
                            selected: _selectedPropertyType == type,
                            onSelected: (selected) {
                              setState(() {
                                _selectedPropertyType =
                                    selected ? type : null;
                              });
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                // Rental Type
                const Text(
                  'Rental Type',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ['Long Term', 'Short Term']
                      .map((type) => FilterChip(
                            label: Text(type),
                            selected: _selectedRentalType ==
                                (type == 'Long Term'
                                    ? 'long_term'
                                    : 'short_term'),
                            onSelected: (selected) {
                              setState(() {
                                _selectedRentalType = selected
                                    ? (type == 'Long Term'
                                        ? 'long_term'
                                        : 'short_term')
                                    : null;
                              });
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                // Bedrooms
                const Text(
                  'Bedrooms',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [1, 2, 3, 4, 5]
                      .map((nume) => FilterChip(
                            label: Text(nume.toString()),
                            selected: _selectedBedrooms == nume,
                            onSelected: (selected) {
                              setState(() {
                                _selectedBedrooms = selected ? nume : null;
                              });
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                // Bathrooms
                const Text(
                  'Bathrooms',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [1, 2, 3, 4]
                      .map((nume) => FilterChip(
                            label: Text(nume.toString()),
                            selected: _selectedBathrooms == nume,
                            onSelected: (selected) {
                              setState(() {
                                _selectedBathrooms = selected ? nume : null;
                              });
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                // Apply Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _loadProperties();
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Filters'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Search Properties'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by city...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value.isEmpty ? null : value;
                });
                _loadProperties();
              },
            ),
          ),
          Expanded(
            child: Consumer<PropertyProvider>(
              builder: (context, propertyProvider, _) {
                if (propertyProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (propertyProvider.properties.isEmpty) {
                  return const Center(
                    child: Text('No properties found'),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: propertyProvider.properties.length,
                  itemBuilder: (context, index) {
                    final property = propertyProvider.properties[index];
                    return PropertyCard(
                      property: property,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PropertyDetailScreen(property: property),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
