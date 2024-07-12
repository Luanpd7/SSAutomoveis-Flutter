import 'package:flutter/material.dart';

class FormDropRent<T> extends StatelessWidget {
  final String labelDrop;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemAsString;

  FormDropRent({
    required this.labelDrop,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      
       decoration: InputDecoration(
        
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                color: Color.fromRGBO(224, 224, 224, 1.0),
                width: 1 , 
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            labelText: labelDrop,
          ),
           style: Theme.of(context).textTheme.bodyLarge,
          dropdownColor: Colors.white,
      value: value,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, 
            child: Text(itemAsString(item),  
             overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}