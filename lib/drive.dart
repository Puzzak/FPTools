import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Translit {
  final _transliteratedSymbol = <String, String>{
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Е': 'E',
    'З': 'Z',
    'И': 'I',
    'Й': 'J',
    'К': 'K',
    'Л': 'L',
    'М': 'M',
    'Н': 'N',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Т': 'T',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'C',
    'Ы': 'Y',
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'з': 'z',
    'и': 'i',
    'й': 'j',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'c',
    'ы': 'y',
    "'": '',
    '"': '',
  };

  final _complicatedSymbols = <String, String>{
    'Є': 'Ye',
    'є': 'ye',
    'Ґ': 'G',
    'ґ': 'g',
    'ё': 'yo',
    'Ё': 'Yo',
    'І': 'I',
    'і': 'i',
    'Ї': 'Yi',
    'ї': 'yi',
    'Ж': 'Zh',
    'Щ': 'Shhch',
    'Ш': 'Shh',
    'Ч': 'Ch',
    'Э': "Eh'",
    'Ю': 'Yu',
    'Я': 'Ya',
    'ё': 'yo',
    'ж': 'zh',
    'щ': 'shhch',
    'ш': 'shh',
    'ч': 'ch',
    'э': "eh'",
    'ъ': '"',
    'ь': "'",
    'ю': 'yu',
    'я': 'ya',
  };


  /// Method for converting to translit for the [source] value
  String toTranslit({required String source}) {
    if (source.isEmpty) return source;

    final regExp = RegExp(
      '([А-Яа-яёЁЇїІіЄєҐґ]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    final translit = <String>[];
    final sourceSymbols = <String>[...source.split('')];

    _transliteratedSymbol.addAll(_complicatedSymbols);

    for (final element in sourceSymbols) {
      final transElement = _transliteratedSymbol.containsKey(element)
          ? _transliteratedSymbol[element] ?? ''
          : element;
      translit.add(transElement);
    }

    return translit.join();
  }
}

class niceEngine with material.ChangeNotifier{

}