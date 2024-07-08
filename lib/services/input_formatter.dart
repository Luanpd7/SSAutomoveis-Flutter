import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter {
  //Máscara CPF para adicionar no campo
  final cpfMaskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  //Máscara CNPJ campo
  final cnpjMaskFormatter = MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

  //Máscara telefone campo
  final phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) ####-####', filter: {"#": RegExp(r'[0-9]')});

  //Máscara percentual campo
  final valueMaskFormatter =
      MaskTextInputFormatter(mask: '## %', filter: {"#": RegExp(r'[0-9]')});

  //Máscara placa do veículo campo
  final plateMaskFormatter = MaskTextInputFormatter(
      mask: '###-###', filter: {"#": RegExp(r'[0-9]')});

  
  //Máscara placa do veículo campo
  final yearMaskFormatter = MaskTextInputFormatter(
      mask: '####', filter: {"#": RegExp(r'[0-9]')});


   //Máscara tipo double campo
  final realMaskFormatter = MaskTextInputFormatter(
      mask: '##,##', filter: {"#": RegExp(r'[0-9]')});

  // Método para remover máscara de CNPJ
  String removeCnpjMask(String cnpj) {
    return cnpj.replaceAll(RegExp(r'[^\d]'), '');
  }

  // Método para adicionar máscara de CNPJ
  String addCnpjMask(String cnpj) {
    return cnpjMaskFormatter.maskText(cnpj);
  }

  // Método para adicionar máscara de Telefone
  String addPhoneMask(String phone) {
    return phoneMaskFormatter.maskText(phone);
  }
}
