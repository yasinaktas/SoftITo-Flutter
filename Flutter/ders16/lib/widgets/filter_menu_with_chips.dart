import 'package:flutter/material.dart';

class FilterMenuWithChips extends StatefulWidget {
  const FilterMenuWithChips({super.key});

  @override
  State<FilterMenuWithChips> createState() => _FilterMenuWithChipsState();
}

class _FilterMenuWithChipsState extends State<FilterMenuWithChips> {
  final Map<String, List<String>> filters = {
    "Renk": ["Kırmızı", "Mavi", "Yeşil", "Sarı", "Beyaz", "Siyah", "Mor"],
    "Beden": ["S", "M", "L", "XL", "XXL"],
    "Marka": ["Nike", "Adidas", "Puma", "Converse"],
  };
  final Set<String> selectedFilters = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kategori Seçimi"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Filtreler", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 12),
            ...filters.entries.map((entry) {
              final kategori = entry.key;
              final secenekler = entry.value;
              return ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(),
                title: Text(kategori),
                children: [
                  Wrap(
                    spacing: 8,
                    children: secenekler.map((secenek) {
                      return ChoiceChip(
                        label: Text(secenek),
                        selected: selectedFilters.contains(secenek),
                        onSelected: (value) {
                          setState(() {
                            if (value == true) {
                              selectedFilters.add(secenek);
                            } else {
                              selectedFilters.remove(secenek);
                            }
                          });
                        },
                      );
                      /*CheckboxListTile(
                    title: Text(secenek),
                    value: selectedFilters.contains(secenek),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedFilters.add(secenek);
                        } else {
                          selectedFilters.remove(secenek);
                        }
                      });
                    },
                  );*/
                    }).toList(),
                  ),
                ],
              );
            }),
            Divider(height: 32),
            Text(
              "Seçilen Filtreler",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: selectedFilters.map((filter) {
                return Chip(
                  label: Text(filter),
                  onDeleted: () {
                    setState(() {
                      selectedFilters.remove(filter);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
