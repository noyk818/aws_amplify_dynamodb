/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String? _name2;
  final String? _description;
  final String? _name;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name2 {
    return _name2;
  }
  
  String? get description {
    return _description;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Todo._internal({required this.id, name2, description, required name}): _name2 = name2, _description = description, _name = name;
  
  factory Todo({String? id, String? name2, String? description, required String name}) {
    return Todo._internal(
      id: id == null ? UUID.getUUID() : id,
      name2: name2,
      description: description,
      name: name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
      id == other.id &&
      _name2 == other._name2 &&
      _description == other._description &&
      _name == other._name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name2=" + "$_name2" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todo copyWith({String? id, String? name2, String? description, String? name}) {
    return Todo(
      id: id ?? this.id,
      name2: name2 ?? this.name2,
      description: description ?? this.description,
      name: name ?? this.name);
  }
  
  Todo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name2 = json['name2'],
      _description = json['description'],
      _name = json['name'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name2': _name2, 'description': _description, 'name': _name
  };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField NAME2 = QueryField(fieldName: "name2");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField NAME = QueryField(fieldName: "name");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.NAME2,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();
  
  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}