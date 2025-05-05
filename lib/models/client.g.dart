// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClientCollection on Isar {
  IsarCollection<Client> get clients => this.collection();
}

const ClientSchema = CollectionSchema(
  name: r'Client',
  id: 1578245643436550370,
  properties: {
    r'abonnementMaintenance': PropertySchema(
      id: 0,
      name: r'abonnementMaintenance',
      type: IsarType.bool,
    ),
    r'clesADemander': PropertySchema(
      id: 1,
      name: r'clesADemander',
      type: IsarType.stringList,
    ),
    r'clesDisponibles': PropertySchema(
      id: 2,
      name: r'clesDisponibles',
      type: IsarType.stringList,
    ),
    r'fontainiers': PropertySchema(
      id: 3,
      name: r'fontainiers',
      type: IsarType.objectList,
      target: r'Fontainier',
    ),
    r'nom': PropertySchema(
      id: 4,
      name: r'nom',
      type: IsarType.string,
    ),
    r'numeroContrat': PropertySchema(
      id: 5,
      name: r'numeroContrat',
      type: IsarType.string,
    ),
    r'ouvrages': PropertySchema(
      id: 6,
      name: r'ouvrages',
      type: IsarType.objectList,
      target: r'Ouvrage',
    )
  },
  estimateSize: _clientEstimateSize,
  serialize: _clientSerialize,
  deserialize: _clientDeserialize,
  deserializeProp: _clientDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Ouvrage': OuvrageSchema, r'Fontainier': FontainierSchema},
  getId: _clientGetId,
  getLinks: _clientGetLinks,
  attach: _clientAttach,
  version: '3.1.0+1',
);

int _clientEstimateSize(
  Client object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clesADemander.length * 3;
  {
    for (var i = 0; i < object.clesADemander.length; i++) {
      final value = object.clesADemander[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.clesDisponibles.length * 3;
  {
    for (var i = 0; i < object.clesDisponibles.length; i++) {
      final value = object.clesDisponibles[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.fontainiers.length * 3;
  {
    final offsets = allOffsets[Fontainier]!;
    for (var i = 0; i < object.fontainiers.length; i++) {
      final value = object.fontainiers[i];
      bytesCount += FontainierSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.nom.length * 3;
  bytesCount += 3 + object.numeroContrat.length * 3;
  bytesCount += 3 + object.ouvrages.length * 3;
  {
    final offsets = allOffsets[Ouvrage]!;
    for (var i = 0; i < object.ouvrages.length; i++) {
      final value = object.ouvrages[i];
      bytesCount += OuvrageSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _clientSerialize(
  Client object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.abonnementMaintenance);
  writer.writeStringList(offsets[1], object.clesADemander);
  writer.writeStringList(offsets[2], object.clesDisponibles);
  writer.writeObjectList<Fontainier>(
    offsets[3],
    allOffsets,
    FontainierSchema.serialize,
    object.fontainiers,
  );
  writer.writeString(offsets[4], object.nom);
  writer.writeString(offsets[5], object.numeroContrat);
  writer.writeObjectList<Ouvrage>(
    offsets[6],
    allOffsets,
    OuvrageSchema.serialize,
    object.ouvrages,
  );
}

Client _clientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Client();
  object.abonnementMaintenance = reader.readBool(offsets[0]);
  object.clesADemander = reader.readStringList(offsets[1]) ?? [];
  object.clesDisponibles = reader.readStringList(offsets[2]) ?? [];
  object.fontainiers = reader.readObjectList<Fontainier>(
        offsets[3],
        FontainierSchema.deserialize,
        allOffsets,
        Fontainier(),
      ) ??
      [];
  object.id = id;
  object.nom = reader.readString(offsets[4]);
  object.numeroContrat = reader.readString(offsets[5]);
  object.ouvrages = reader.readObjectList<Ouvrage>(
        offsets[6],
        OuvrageSchema.deserialize,
        allOffsets,
        Ouvrage(),
      ) ??
      [];
  return object;
}

P _clientDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readObjectList<Fontainier>(
            offset,
            FontainierSchema.deserialize,
            allOffsets,
            Fontainier(),
          ) ??
          []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readObjectList<Ouvrage>(
            offset,
            OuvrageSchema.deserialize,
            allOffsets,
            Ouvrage(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clientGetId(Client object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clientGetLinks(Client object) {
  return [];
}

void _clientAttach(IsarCollection<dynamic> col, Id id, Client object) {
  object.id = id;
}

extension ClientQueryWhereSort on QueryBuilder<Client, Client, QWhere> {
  QueryBuilder<Client, Client, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClientQueryWhere on QueryBuilder<Client, Client, QWhereClause> {
  QueryBuilder<Client, Client, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Client, Client, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Client, Client, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Client, Client, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClientQueryFilter on QueryBuilder<Client, Client, QFilterCondition> {
  QueryBuilder<Client, Client, QAfterFilterCondition>
      abonnementMaintenanceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abonnementMaintenance',
        value: value,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clesADemander',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clesADemander',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clesADemander',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clesADemander',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clesADemander',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> clesADemanderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesADemanderLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesADemander',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clesDisponibles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clesDisponibles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clesDisponibles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clesDisponibles',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clesDisponibles',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> clesDisponiblesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      clesDisponiblesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clesDisponibles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      fontainiersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fontainiers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> nomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroContrat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroContrat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroContrat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> numeroContratIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroContrat',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition>
      numeroContratIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroContrat',
        value: '',
      ));
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ouvrages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ClientQueryObject on QueryBuilder<Client, Client, QFilterCondition> {
  QueryBuilder<Client, Client, QAfterFilterCondition> fontainiersElement(
      FilterQuery<Fontainier> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fontainiers');
    });
  }

  QueryBuilder<Client, Client, QAfterFilterCondition> ouvragesElement(
      FilterQuery<Ouvrage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ouvrages');
    });
  }
}

extension ClientQueryLinks on QueryBuilder<Client, Client, QFilterCondition> {}

extension ClientQuerySortBy on QueryBuilder<Client, Client, QSortBy> {
  QueryBuilder<Client, Client, QAfterSortBy> sortByAbonnementMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abonnementMaintenance', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> sortByAbonnementMaintenanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abonnementMaintenance', Sort.desc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> sortByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> sortByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> sortByNumeroContrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroContrat', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> sortByNumeroContratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroContrat', Sort.desc);
    });
  }
}

extension ClientQuerySortThenBy on QueryBuilder<Client, Client, QSortThenBy> {
  QueryBuilder<Client, Client, QAfterSortBy> thenByAbonnementMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abonnementMaintenance', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByAbonnementMaintenanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abonnementMaintenance', Sort.desc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByNumeroContrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroContrat', Sort.asc);
    });
  }

  QueryBuilder<Client, Client, QAfterSortBy> thenByNumeroContratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroContrat', Sort.desc);
    });
  }
}

extension ClientQueryWhereDistinct on QueryBuilder<Client, Client, QDistinct> {
  QueryBuilder<Client, Client, QDistinct> distinctByAbonnementMaintenance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abonnementMaintenance');
    });
  }

  QueryBuilder<Client, Client, QDistinct> distinctByClesADemander() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clesADemander');
    });
  }

  QueryBuilder<Client, Client, QDistinct> distinctByClesDisponibles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clesDisponibles');
    });
  }

  QueryBuilder<Client, Client, QDistinct> distinctByNom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Client, Client, QDistinct> distinctByNumeroContrat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroContrat',
          caseSensitive: caseSensitive);
    });
  }
}

extension ClientQueryProperty on QueryBuilder<Client, Client, QQueryProperty> {
  QueryBuilder<Client, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Client, bool, QQueryOperations> abonnementMaintenanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abonnementMaintenance');
    });
  }

  QueryBuilder<Client, List<String>, QQueryOperations> clesADemanderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clesADemander');
    });
  }

  QueryBuilder<Client, List<String>, QQueryOperations>
      clesDisponiblesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clesDisponibles');
    });
  }

  QueryBuilder<Client, List<Fontainier>, QQueryOperations>
      fontainiersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontainiers');
    });
  }

  QueryBuilder<Client, String, QQueryOperations> nomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nom');
    });
  }

  QueryBuilder<Client, String, QQueryOperations> numeroContratProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroContrat');
    });
  }

  QueryBuilder<Client, List<Ouvrage>, QQueryOperations> ouvragesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ouvrages');
    });
  }
}
