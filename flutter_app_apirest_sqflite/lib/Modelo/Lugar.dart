class Lugar {

   int id;
   String nombre;
   String descripcion;
   String direccion;
   String telefono;
   String website;
   String imagen_nombre;
   String importancia;
   double latitud;
   double longitud;
   String title;
   String reaction;

  Lugar(this.id, this.nombre, this.descripcion, this.direccion, this.telefono,
      this.website, this.imagen_nombre, this.importancia, this.latitud,
      this.longitud, this.title, this.reaction);


  Lugar.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    nombre = map["nombre"];
    descripcion = map["descripcion"];
    direccion = map["direccion"];
    telefono = map["telefono"];
    website = map["website"];
    imagen_nombre = map["imagen_nombre"];
    importancia = map["importancia"];
    latitud = map["latitud"];
    longitud = map["longitud"];
    title = map["title"];
    reaction = map["reaction"];
  }
}
