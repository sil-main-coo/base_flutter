// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "connectionProblem": MessageLookupByLibrary.simpleMessage(
            "There are some problems with the connection. Please try again"),
        "connectionTimedOut": MessageLookupByLibrary.simpleMessage(
            "The connection has timed out. Please try again"),
        "deviceError": MessageLookupByLibrary.simpleMessage(
            "Device error. Please try again"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "failure": MessageLookupByLibrary.simpleMessage("Failure"),
        "invalidCredentials":
            MessageLookupByLibrary.simpleMessage("Invalid credentials"),
        "responseNull":
            MessageLookupByLibrary.simpleMessage("Response is null"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "systemError": MessageLookupByLibrary.simpleMessage(
            "System error. Please try again"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "unKnowError": MessageLookupByLibrary.simpleMessage(
            "Error! An error occurred. Please try again later. Please try again")
      };
}
