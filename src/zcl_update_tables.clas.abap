CLASS zcl_update_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS insertar_datos.  " Método para insertar datos en las tablas
ENDCLASS.

CLASS zcl_update_tables IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        " Llamar al método para insertar datos
        insertar_datos( ).
        out->write( 'Inserción de datos completada con éxito.' ).
      CATCH cx_root INTO DATA(lx_error).
        out->write( |Error: { lx_error->get_text( ) }| ).
    ENDTRY.
  ENDMETHOD.

  METHOD insertar_datos.
    " Declaración de estructuras internas para almacenar datos de las tablas
    DATA lt_categoria TYPE TABLE OF ztb_catego_lm.
    DATA lt_cliente   TYPE TABLE OF ztb_clientes_lm.
    DATA lt_libro     TYPE TABLE OF ztb_libros_lm.
    DATA lt_acc_categ TYPE TABLE OF ztb_acc_categ_lm.
    DATA lt_clnts_lib TYPE TABLE OF ztb_clnts_lib_lm.

    " Inserción de registros en la tabla de categorías de acceso
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'A'
                    tipo_acceso = '1' ) TO lt_acc_categ.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'B'
                    tipo_acceso = '2' ) TO lt_acc_categ.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'C'
                    tipo_acceso = '3' ) TO lt_acc_categ.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'D'
                    tipo_acceso = '4' ) TO lt_acc_categ.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'E'
                    tipo_acceso = '5' ) TO lt_acc_categ.
    INSERT ztb_acc_categ_lm FROM TABLE @lt_acc_categ.

    " Inserción de registros en la tabla de categorías
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'A'
                    descripcion = 'Acceso General' ) TO lt_categoria.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'B'
                    descripcion = 'Acceso Premium' ) TO lt_categoria.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'C'
                    descripcion = 'Acceso Restringido' ) TO lt_categoria.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'D'
                    descripcion = 'Acceso VIP' ) TO lt_categoria.
    APPEND VALUE #( client      = sy-mandt
                    bi_categ    = 'E'
                    descripcion = 'Acceso Ilimitado' ) TO lt_categoria.
    INSERT ztb_catego_lm FROM TABLE @lt_categoria.

    " Inserción de registros en la tabla de clientes
    APPEND VALUE #( client      = sy-mandt
                    id_cliente  = 'C123'
                    tipo_acceso = '1'
                    nombre      = 'Juan'
                    apellidos   = 'Pérez'
                    email       = 'juan.perez@email.com'
                    url         = 'www.juanperez.com' ) TO lt_cliente.
    APPEND VALUE #( client      = sy-mandt
                    id_cliente  = 'C456'
                    tipo_acceso = '2'
                    nombre      = 'Ana'
                    apellidos   = 'Gómez'
                    email       = 'ana.gomez@email.com'
                    url         = 'www.anagomez.com' ) TO lt_cliente.
    APPEND VALUE #( client      = sy-mandt
                    id_cliente  = 'C789'
                    tipo_acceso = '3'
                    nombre      = 'Luis'
                    apellidos   = 'Martínez'
                    email       = 'luis.martinez@email.com'
                    url         = 'www.luismartinez.com' ) TO lt_cliente.
    APPEND VALUE #( client      = sy-mandt
                    id_cliente  = 'C987'
                    tipo_acceso = '4'
                    nombre      = 'Carla'
                    apellidos   = 'Fernández'
                    email       = 'carla.fernandez@email.com'
                    url         = 'www.carlafernandez.com' ) TO lt_cliente.
    APPEND VALUE #( client      = sy-mandt
                    id_cliente  = 'C654'
                    tipo_acceso = '5'
                    nombre      = 'Pedro'
                    apellidos   = 'López'
                    email       = 'pedro.lopez@email.com'
                    url         = 'www.pedrolopez.com' ) TO lt_cliente.
    INSERT ztb_clientes_lm FROM TABLE @lt_cliente.

    " Inserción de registros en la tabla de libros
    APPEND VALUE #( client    = sy-mandt
                    id_libro  = 'L001'
                    bi_categ  = 'A'
                    titulo    = 'ABAP para Principiantes'
                    autor     = 'SAP Expert'
                    editorial = 'SAP Press'
                    idioma    = 'E'
                    paginas   = '350'
                    precio    = '50'
                    moneda    = 'USD'
                    formato   = '1'
                    url       = 'www.librosap.com' ) TO
lt_libro.
    APPEND VALUE #( client    = sy-mandt
                    id_libro  = 'L002'
                    bi_categ  = 'B'
                    titulo    = 'ABAP Avanzado'
                    autor     = 'SAP Master'
                    editorial = 'Tech Books'
                    idioma    = 'E'
                    paginas   = '500'
                    precio    = '80'
                    moneda    = 'EUR'
                    formato   = '2'
                    url       = 'www.techbooks.com' ) TO lt_libro.
    APPEND VALUE #( client    = sy-mandt
                    id_libro  = 'L003'
                    bi_categ  = 'C'
                    titulo    = 'SAP Fiori Basics'
                    autor     = 'UI5 Guru'
                    editorial = 'SAP Press'
                    idioma    = 'E'
                    paginas   = '300'
                    precio    = '60'
                    moneda    = 'USD'
                    formato   = '1'
                    url       = 'www.sapfiori.com' ) TO lt_libro.
    APPEND VALUE #( client    = sy-mandt
                    id_libro  = 'L004'
                    bi_categ  = 'D'
                    titulo    = 'SAP HANA for Developers'
                    autor     = 'DB Expert'
                    editorial = 'Tech Books'
                    idioma    = 'E'
                    paginas   = '450'
                    precio    = '90'
                    moneda    = 'USD'
                    formato   = '1'
                    url       = 'www.hanadev.com' ) TO
lt_libro.
    APPEND VALUE #( client    = sy-mandt
                    id_libro  = 'L005'
                    bi_categ  = 'E'
                    titulo    = 'OData and SAP Gateway'
                    autor     = 'API Master'
                    editorial = 'Tech Books'
                    idioma    = 'E'
                    paginas   = '400'
                    precio    = '70'
                    moneda    = 'EUR'
                    formato   = '2'
                    url       = 'www.odatabook.com' ) TO
lt_libro.
    INSERT ztb_libros_lm FROM TABLE @lt_libro.

    " Inserción de registros en la tabla de relaciones clientes-libros
    APPEND VALUE #( client     = sy-mandt
                    id_cliente = 'C123'
                    id_libro   = 'L001' ) TO lt_clnts_lib.
    APPEND VALUE #( client     = sy-mandt
                    id_cliente = 'C456'
                    id_libro   = 'L002' ) TO lt_clnts_lib.
    APPEND VALUE #( client     = sy-mandt
                    id_cliente = 'C789'
                    id_libro   = 'L003' ) TO lt_clnts_lib.
    APPEND VALUE #( client     = sy-mandt
                    id_cliente = 'C987'
                    id_libro   = 'L004' ) TO lt_clnts_lib.
    APPEND VALUE #( client     = sy-mandt
                    id_cliente = 'C654'
                    id_libro   = 'L005' ) TO lt_clnts_lib.
    INSERT ztb_clnts_lib_lm FROM TABLE @lt_clnts_lib.

    " Confirmar la transacción en la base de datos
    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.


