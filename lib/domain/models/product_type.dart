/// Desteklenen tütün/nikotin ürünleri.
/// Her ürünün birimi ve toksin katsayısı FARKLIDIR — sigara katsayısı
/// nargile veya vape için kullanılamaz (bilimsel olarak yanlış olur).
enum ProductType {
  cigarette, // birim: adet
  rollYourOwn, // birim: adet
  vape, // birim: puf / ml
  hookah, // birim: seans
  cigar, // birim: adet
  snus, // birim: poşet
}

extension ProductTypeUnit on ProductType {
  /// Toksin hesabında bu ürün için katran/CO uygulanır mı?
  /// Vape ve snus yanma ürünü değildir → katran ve CO sıfırdır.
  bool get isCombustible => switch (this) {
        ProductType.cigarette ||
        ProductType.rollYourOwn ||
        ProductType.hookah ||
        ProductType.cigar =>
          true,
        ProductType.vape || ProductType.snus => false,
      };
}
