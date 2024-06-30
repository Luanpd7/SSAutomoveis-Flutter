import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter{

  //Máscara CPF
    final cpfMaskFormatter = MaskTextInputFormatter(mask: '###.###.###-##', 
  filter: { "#": RegExp(r'[0-9]') });

   //Máscara CNPJ
    final cnpjMaskFormatter = MaskTextInputFormatter(mask: '##.###.###/####-##', 
  filter: { "#": RegExp(r'[0-9]') });

  //Máscara telefone
  final phoneMaskFormatter = MaskTextInputFormatter(mask: '(##) #####-####', 
  filter: { "#": RegExp(r'[0-9]') });

   //Máscara percentual
    final valueMaskFormatter = MaskTextInputFormatter(mask: '## %', 
  filter: { "#": RegExp(r'[0-9]') });
  
}