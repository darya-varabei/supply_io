class ChemicalCompositionModel{
  final int chemicalCompositionId;
  final double? c;
  final double? mn;
  final double? si;
  final double? s;
  final double? p;
  final double? cr;
  final double ni;
  final double? cu;
  final double? as;
  final double? n2;
  final double? al;
  final double? ti;
  final double? mo;
  final double? w;
  final double? v;
  final double? alWuthN2;
  final double? cev;
  final double? notes;

  ChemicalCompositionModel({
      required this.chemicalCompositionId,
      this.c,
      this.mn,
      this.si,
      this.s,
      this.p,
      this.cr,
      required this.ni,
      this.cu,
      this.as,
      this.n2,
      this.al,
      this.ti,
      this.mo,
      this.w,
      this.v,
      this.alWuthN2,
      this.cev,
      this.notes
}
);

  factory ChemicalCompositionModel.fromJson(Map<String, dynamic> json) {
    return ChemicalCompositionModel(
        chemicalCompositionId: json['chemicalCompositionId'],
        c: json['c'],
        mn: json['mn'],
        si: json['si'],
        s: json['s'],
        p: json['p'],
        cr: json['cr'],
        ni: json['ni'],
        cu: json['cu'],
        as: json['as'],
        n2: json['n2'],
        al: json['al'],
        ti: json['ti'],
        mo: json['mo'],
        w: json['w'],
        v: json['v'],
        alWuthN2: json['alWuthN2'],
        cev: json['cev'],
      notes: json['notes']
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'chemicalCompositionId': chemicalCompositionId,
      'c': c,
      'mn': mn,
      'si': si,
      's': s,
      'p': p,
      'cr': cr,
      'ni': ni,
      'cu': cu,
      'as': as,
      'n2': n2,
      'al': al,
      'ti': ti,
      'mo': mo,
      'w': w,
      'v': v,
      'alWuthN2': alWuthN2,
      'cev': cev,
      'notes': notes,
    };

    return map;
  }
}