# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import User
from django.core.mail import EmailMultiAlternatives
import datetime


class Smsrecibidos(models.Model):
    text = models.CharField(max_length=1000)
    when = models.DateTimeField(blank=True, null=True)
    sender = models.CharField(max_length=1000,blank=True, null=True)
    receiver = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Sms Recibidos'

    def __unicode__(self):
        return self.text

class Sexo(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Sexo'

    def __unicode__(self):
        return self.nombre


class Categoria(models.Model):
    nombre = models.CharField(max_length=1000)
    photo = models.FileField(upload_to='static',blank=True, null=True)

    photo_home = models.FileField(upload_to='static',blank=True, null=True)
    orden = models.IntegerField(blank=True, null=True)
    icono = models.FileField(upload_to='static',blank=True, null=True)
    icono_seleccionado = models.FileField(upload_to='static',blank=True, null=True)
    sexo = models.ForeignKey(Sexo,blank=True, null=True)
    visible  = models.BooleanField(default=False)

    class Meta:
        managed = True
        verbose_name = 'Categoria'

    def __unicode__(self):
        return self.nombre

class Subcategoria(models.Model):
    nombre = models.CharField(max_length=1000)
    categoria = models.ForeignKey(Categoria,blank=True, null=True)
    precio = models.FloatField(blank=True, null=True)
    descripcion = models.TextField(max_length=1000,blank=True, null=True)
    photo = models.FileField(upload_to='static',blank=True, null=True)
    photo_icono = models.FileField(upload_to='static',blank=True, null=True)
    orden = models.IntegerField(blank=True, null=True)
    duracion_servicio = models.IntegerField(blank=True, null=True)
    descuento = models.IntegerField(blank=True, null=True)
    activar_descuento  = models.BooleanField(default=False)
    visible  = models.BooleanField(default=False)

    class Meta:
        managed = True
        verbose_name = 'Subcategoria'

    def __unicode__(self):
        return self.nombre


class Portadaphoto(models.Model):
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    photo = models.FileField(upload_to='static',blank=True, null=True)
    enlace = models.CharField(max_length=1000,blank=True, null=True)
    sexo = models.ForeignKey(Sexo,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Portada/Photo'

    def __unicode__(self):
        return self.nombre

class Publicidad(models.Model):
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    photo = models.FileField(upload_to='static',blank=True, null=True)
    enlace = models.CharField(max_length=1000,blank=True, null=True)
    sexo = models.ForeignKey(Sexo,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Publicidad Externa'

    def __unicode__(self):
        return self.nombre




class Distrito(models.Model):
    nombre = models.CharField(max_length=1000)
    porcentaje_descuento = models.FloatField(max_length=1000,blank=True, null=True) 
    codigo_postal = models.CharField(max_length=1000,blank=True, null=True)
    latitud = models.CharField(max_length=1000,blank=True, null=True)
    longitud = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Distrito'

    def __unicode__(self):
        return self.nombre

class Tiponotificacion(models.Model):
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    plantilla=models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Tipo Notificacion'

    def __unicode__(self):
        return self.nombre


class Estadocompartir(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Estado de Compartir'

    def __unicode__(self):
        return self.nombre





class Cliente(models.Model):
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    apellido = models.CharField(max_length=1000,blank=True, null=True)
    edad = models.CharField(max_length=1000,blank=True, null=True)
    telefono = models.CharField(max_length=1000,blank=True, null=True)
    email = models.CharField(max_length=1000,blank=True, null=True)
    user = models.ForeignKey(User,blank=True, null=True)
    numero_notificacion = models.CharField(max_length=1000, blank=True, null=True)
    photo = models.FileField(upload_to='static',blank=True, null=True)
    direccion = models.CharField(max_length=1000, blank=True, null=True)
    distrito = models.ForeignKey(Distrito, models.DO_NOTHING, db_column='distrito', blank=True, null=True)
    sexo = models.CharField(max_length=1000, blank=True, null=True)
    photo_facebook = models.CharField(max_length=5000, blank=True, null=True)
    modelo_celular = models.CharField(max_length=1000, blank=True, null=True)
    version_celular = models.CharField(max_length=1000, blank=True, null=True)
    codigo_compartir = models.CharField(max_length=1000, blank=True, null=True)
    codigo_recibido = models.CharField(max_length=1000, blank=True, null=True)
    fecha_compartio = models.DateTimeField(blank=True, null=True)
    fecha_inscripcion = models.DateTimeField(blank=True, null=True)
    estado_compartir = models.ForeignKey(Estadocompartir, models.DO_NOTHING, db_column='estado_compartir', blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Cliente'

    def __unicode__(self):

        if self.nombre:
            return self.nombre
        else:
            return 'No tiene nombre'


class Promocodigo(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)
    codigo = models.CharField(max_length=1000, blank=True, null=True)
    descuento = models.IntegerField(max_length=1000, blank=True, null=True)
    estado_compartir = models.ForeignKey(Estadocompartir, models.DO_NOTHING, db_column='estado_compartir', blank=True, null=True)
    cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='cliente', blank=True, null=True)
    cliente_compartido = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='cliente_compartido', blank=True, null=True,related_name='cliente_compartido')
    fecha_creacion=models.DateTimeField(blank=True,null=True,default=datetime.datetime.today())
    fecha_compartir=models.DateTimeField(blank=True,null=True)
    
    class Meta:
        managed = True
        verbose_name = 'Promo codigos'

    def __unicode__(self):
        return self.nombre


class Personas(models.Model):
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    apellido = models.CharField(max_length=1000,blank=True, null=True)
    edad = models.CharField(max_length=1000,blank=True, null=True)
    telefono = models.CharField(max_length=1000,blank=True, null=True)
    email = models.CharField(max_length=1000,blank=True, null=True)
    direccion = models.CharField(max_length=1000, blank=True, null=True)
    distrito= models.CharField(max_length=1000, blank=True, null=True)
    fijo= models.CharField(max_length=1000, blank=True, null=True)
    sexo = models.CharField(max_length=1000, blank=True, null=True)
    dni = models.CharField(max_length=1000, blank=True, null=True)
    trabajo = models.CharField(max_length=1000, blank=True, null=True)
    dni = models.CharField(max_length=1000, blank=True, null=True)
    fecha_nacimiento = models.CharField(max_length=1000, blank=True, null=True)
    origen = models.CharField(max_length=1000, blank=True, null=True)
    fecha = models.DateTimeField(blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Persona'

    def __unicode__(self):

        if self.nombre:
            return self.nombre
        else:
            return 'No tiene nombre'




class Campania(models.Model):
    activo = models.BooleanField(default=0)    
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    fecha = models.DateTimeField(null=True,blank=True,default=datetime.datetime.today())
    estado=models.ForeignKey(Estadocompartir, models.DO_NOTHING, db_column='estado_compartir', blank=True, null=True)
    filtro = models.CharField('Slug',max_length=1000,blank=True, null=True)
    descripcion =models.TextField(max_length=5000,blank=True, null=True)
    email = models.BooleanField(default=0)
    notificacion = models.BooleanField(default=0)
    sms = models.BooleanField(default=0)
        

    def __unicode__(self):

        return self.nombre

class EnvioMasivo(models.Model):
    campania = models.ForeignKey(Campania, models.DO_NOTHING, db_column='campania', blank=True, null=True)
    nombre = models.CharField(max_length=1000,blank=True, null=True)
    apellido = models.CharField(max_length=1000,blank=True, null=True)
    edad = models.CharField(max_length=1000,blank=True, null=True)
    telefono = models.CharField(max_length=1000,blank=True, null=True)
    email = models.CharField(max_length=1000,blank=True, null=True)
    direccion = models.CharField(max_length=1000, blank=True, null=True)
    distrito= models.CharField(max_length=1000, blank=True, null=True)
    fijo= models.CharField(max_length=1000, blank=True, null=True)
    sexo = models.CharField(max_length=1000, blank=True, null=True)
    dni = models.CharField(max_length=1000, blank=True, null=True)
    trabajo = models.CharField(max_length=1000, blank=True, null=True)
    dni = models.CharField(max_length=1000, blank=True, null=True)
    fecha_nacimiento = models.CharField(max_length=1000, blank=True, null=True)
    origen = models.CharField(max_length=1000, blank=True, null=True)
    fecha = models.DateTimeField(blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Envio Masivo'

    def __unicode__(self):

        return self.campania


class Estadosocia(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Estado de Socia'

    def __unicode__(self):
        return self.nombre

class Socia(models.Model):
    user = models.ForeignKey(User, models.DO_NOTHING, db_column='user', blank=True, null=True)
    nombre = models.CharField(max_length=1000, blank=True, null=True)
    apellido = models.CharField(max_length=1000, blank=True, null=True)
    dni = models.IntegerField(blank=True, null=True)
    telefono = models.CharField(max_length=1000, blank=True, null=True)
    whatsapp = models.CharField(max_length=1000, blank=True, null=True)
    email = models.CharField(max_length=1000, blank=True, null=True)
    direccion = models.CharField(max_length=1000, blank=True, null=True)
    distrito = models.ForeignKey(Distrito, models.DO_NOTHING, db_column='distrito', blank=True, null=True)
    referencia = models.CharField(max_length=1000, blank=True, null=True)
    comentario = models.CharField(max_length=1000, blank=True, null=True)
    texperiencia = models.CharField(max_length=1000, blank=True, null=True)
    photo = models.FileField(upload_to='static',blank=True, null=True)
    ncuenta = models.CharField(max_length=1000, blank=True, null=True)
    descripcion_titulo = models.CharField(max_length=1000, blank=True, null=True)    
    descripcion_socia = models.TextField(max_length=1000, blank=True, null=True)
    numero_notificacion = models.CharField(max_length=1000, blank=True, null=True)
    latitud = models.CharField(max_length=1000, blank=True, null=True)
    longitud = models.CharField(max_length=1000, blank=True, null=True)
    comentario = models.TextField(max_length=1000, blank=True, null=True)
    distancia = models.CharField(max_length=1000, blank=True, null=True)
    estado_socia = models.ForeignKey(Estadosocia, models.DO_NOTHING, db_column='estado_socia', blank=True, null=True)
    modelo_celular = models.CharField(max_length=1000, blank=True, null=True)
    version_celular = models.CharField(max_length=1000, blank=True, null=True)
    fecha_inscripcion = models.DateTimeField(blank=True, null=True)
    codigo_compartir = models.CharField(max_length=1000, blank=True, null=True)
    estrellas = models.CharField(max_length=1000, blank=True, null=True)
    fecha_compartio = models.DateTimeField(blank=True, null=True)
    fecha_inscripcion = models.DateTimeField(blank=True, null=True)
    estado_compartir = models.ForeignKey(Estadocompartir, models.DO_NOTHING, db_column='estado_compartir', blank=True, null=True)
    linea  = models.BooleanField(default=False)


    class Meta:
        managed = True
        db_table = 'socia'
        verbose_name = 'Socia'

    def __unicode__(self):

        if self.nombre:
            return self.nombre
        else:
            return 'No tiene socia'



class Sociacategoria(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    categoria = models.ForeignKey(Categoria,blank=True, null=True)
    texperiencia = models.CharField(max_length=1000, blank=True, null=True)
    comentario = models.TextField(max_length=1000, blank=True, null=True)
    referencia = models.CharField(max_length=1000, blank=True, null=True)
    validar  = models.BooleanField(default=False)
    descripcion= models.CharField(max_length=1000, blank=True, null=True)
    titulo = models.CharField(max_length=1000, blank=True, null=True)
    costo = models.IntegerField(max_length=1000, blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Socia/Categoria'

    def __unicode__(self):
        return self.socia.nombre+'/'+self.categoria.nombre

   
class Sociasubcategoria(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    sociacategoria = models.ForeignKey(Sociacategoria,blank=True, null=True,related_name='sociasubcategoria')
    subcategoria = models.ForeignKey(Subcategoria,blank=True, null=True)
    texperiencia = models.CharField(max_length=1000, blank=True, null=True)
    comentario = models.TextField(max_length=1000, blank=True, null=True)
    referencia = models.CharField(max_length=1000, blank=True, null=True)
    validar  = models.BooleanField(default=False)
    descripcion= models.CharField(max_length=1000, blank=True, null=True)
    titulo = models.CharField(max_length=1000, blank=True, null=True)
    costo = models.IntegerField(max_length=1000, blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Socia/Especialidad'

    def __unicode__(self):
        return self.socia.nombre+'/'+self.subcategoria.nombre




class Sociacategoriaphoto(models.Model):
    categoria= models.ForeignKey(Categoria,blank=True,null=True)
    socia= models.ForeignKey(Socia,blank=True,null=True)
    photo =  models.FileField(upload_to='static',blank=True, null=True)
    fecha=models.DateTimeField(blank=True,default=datetime.datetime.today())

    class Meta:
        managed = True
        verbose_name = 'Publicacion / Photos'

    def __unicode__(self):
        return str(self.photo)



class Sociacomentario(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    comentario = models.TextField(max_length=1000, blank=True, null=True)
    cliente = models.ForeignKey(Cliente,blank=True, null=True)
    fecha=models.DateTimeField(blank=True,default=datetime.datetime.today())

    class Meta:
        managed = True
        verbose_name = 'Socia/ Comentario'

    def __unicode__(self):
        return self.comentario




class Clientesocias(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    cliente = models.ForeignKey(Cliente,blank=True, null=True)



    class Meta:
        managed = True
        verbose_name = 'Clientes/Socias'

    def __unicode__(self):
        return self.socia.nombre+'/'+self.cliente.nombre

   
class Sociadistrito(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    distrito = models.ForeignKey(Distrito,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Socia/Distrito'

    def __unicode__(self):
        return self.socia.nombre+'/'+self.distrito.nombre


class Compartir(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True,related_name='socia')
    socia_compartir = models.ForeignKey(Socia,blank=True, null=True,related_name='socia_compartir')
    codigo_compartir = models.CharField(max_length=1000,blank=True, null=True)
    fecha_compartir = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Compartir'

    def __unicode__(self):
        return self.socia.nombre


class TraficoSMS(models.Model):
    mensaje = models.CharField(max_length=1000,blank=True, null=True)
    telefono = models.CharField(max_length=1000,blank=True, null=True)
    referencia = models.CharField(max_length=1000,blank=True, null=True)
    codigo = models.CharField(max_length=1000,blank=True, null=True)
    fecha = models.DateTimeField(blank=True, null=True,default=datetime.datetime.today())

    class Meta:
        managed = True
        verbose_name = 'Trafico SMS'

    def __unicode__(self):
        return self.mensaje


class Opcion(models.Model):
    sociasubcategoria = models.ForeignKey(Sociasubcategoria,blank=True, null=True)
    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Socia/Especialidad/Opcion'

    def __unicode__(self):
        return self.nombre

class Turno(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Turno'

    def __unicode__(self):
        return self.nombre



class Dia(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Dia'

    def __unicode__(self):
        return self.nombre


class Estado(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Estado del Servicio'

    def __unicode__(self):
        return self.nombre

class Servicio(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    cliente = models.ForeignKey(Cliente,max_length=1000,blank=True, null=True)
    fecha = models.DateField(blank=True, null=True)
    dia = models.ForeignKey(Dia,blank=True, null=True)
    fecha_inicio = models.TimeField('Hora Inicio',blank=True, null=True)
    fecha_fin = models.TimeField('Hora Fin',blank=True, null=True)
    #notificacion_titulo= models.CharField(max_length=1000,blank=True)
    #notificacion_cuerpo= models.TextField(max_length=1000,blank=True)
    puntaje=models.IntegerField(blank=True, null=True)
    precio = models.FloatField('Precio Total',blank=True, null=True)
    precio_promo = models.FloatField('Precio Promo',blank=True, null=True)
    promo_codigo = models.ForeignKey(Promocodigo,max_length=1000,blank=True, null=True)
    latitud = models.CharField(max_length=1000,blank=True, null=True)
    longitud = models.CharField(max_length=1000,blank=True, null=True)
    estado = models.ForeignKey(Estado,default=3)
    referencia = models.CharField('Direccion',max_length=1000,default='')
    token=models.CharField(max_length=10000,blank=True, null=True)
    fecha_pago = models.DateTimeField(blank=True, null=True)
    pago=models.IntegerField(blank=True, null=True)
    tipo_vivienda = models.CharField(max_length=1000,blank=True, null=True)
    dato_lugar = models.CharField(max_length=1000,blank=True, null=True)
    eliminado = models.BooleanField(blank=True, default=0)


    


    class Meta:
        managed = True
        verbose_name = 'Servicio'
        ordering = ['-id',]

    def __unicode__(self):

        return str(self.id)
            #return 'hshs'
         
        # else:

        #     return str(self.id)+'-'+'Sin asignar-'+self.cliente.nombre



class Serviciopago(models.Model):

    servicio=models.ForeignKey(Servicio,max_length=1000,blank=True, null=True)
    pago=models.IntegerField(blank=True, null=True)
    fecha = models.DateTimeField(blank=True, null=True)


class Serviciopedido(models.Model):
    servicio = models.ForeignKey(Servicio,blank=True, null=True)

    subcategoria =models.ForeignKey(Subcategoria,blank=True,null=True)
    socia = models.ForeignKey(Socia,blank=True, null=True)
    estado = models.ForeignKey(Estado,blank=True,null=True)
    precio = models.IntegerField(blank=True, null=True)
    descuento = models.IntegerField(blank=True, null=True)
    precio_con_descuento = models.FloatField(blank=True, null=True)
    cantidad = models.IntegerField(blank=True, null=True)
    estrella = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Servicio / Pedido'

    def __unicode__(self):
        return self.subcategoria.nombre


class Serviciosintentos(models.Model):
    socia = models.ForeignKey(Socia,blank=True, null=True)
    servicio = models.ForeignKey(Servicio,blank=True, null=True)
    fecha = models.DateTimeField(max_length=1000, blank=True, null=True)
    detalle = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Servicio/Intento'

    def __unicode__(self):
        return self.socia.nombre


class Fotos(models.Model):


    foto = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Otros'

    def __unicode__(self):
        return self.foto



class Turnosocia(models.Model):

    socia = models.ForeignKey(Socia,blank=True, null=True)
    fecha_inicio = models.TimeField(blank=True, null=True)
    fecha_fin = models.TimeField(blank=True, null=True)
    dia = models.ForeignKey(Dia,blank=True, null=True)
    

    class Meta:
        managed = True
        verbose_name = 'Turno/Socia'

    def __unicode__(self):
        return self.socia.nombre


class Configuracion(models.Model):

    email = models.CharField(max_length=1000,blank=True, null=True)
    tema = models.CharField(max_length=1000,blank=True, null=True)
    contenido = models.TextField(max_length=1000,blank=True, null=True)
    imagen1 = models.FileField(upload_to='static',blank=True, null=True)
    imagen2 = models.FileField(upload_to='static',blank=True, null=True)
    imagen3 = models.FileField(upload_to='static',blank=True, null=True)
    activa_anuncio = models.BooleanField(default=False)


    class Meta:
        managed = True
        verbose_name = 'Configuracion de Correo Masivo'

    def __unicode__(self):
        return self.contenido

class Trafico(models.Model):

    email = models.CharField(max_length=1000,blank=True, null=True)
    tema = models.CharField(max_length=1000,blank=True, null=True)
    contenido = models.CharField(max_length=1000,blank=True, null=True)
    destino = models.CharField(max_length=1000,blank=True, null=True)
    fecha = models.DateField(max_length=1000, blank=True, null=True)


  
    class Meta:
        managed = True
        verbose_name = 'Trafico Correo Masivo'

    def __unicode__(self):
        return self.contenido


class Tema(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)

    def __unicode__(self):
        return self.nombre

class Personalizar(models.Model):

    tema = models.ForeignKey(Tema,blank=True, null=True)
    logo = models.FileField(upload_to='static',blank=True, null=True,help_text='Subir un logo 500 x 200')
    nombre = models.CharField(max_length=1000,blank=True, null=True)

  
    class Meta:
        managed = True
        verbose_name = 'Personalizar'

class Favoritos(models.Model):

    cliente = models.ForeignKey(Cliente,blank=True, null=True)
    sociacategoria = models.ForeignKey(Sociacategoria,blank=True, null=True)
    
  
    class Meta:
        managed = True
        verbose_name = 'Favorito'

class Clientesocias(models.Model):

    cliente = models.ForeignKey(Cliente,blank=True, null=True)
    socia = models.ForeignKey(Socia,blank=True, null=True)
    
  
    class Meta:
        managed = True
        verbose_name = 'Clientesocias'

class Historiaclientesocias(models.Model):

    clientesocia = models.ForeignKey(Clientesocias,blank=True, null=True)
    mensaje = models.CharField(max_length=1000,blank=True, null=True)
    fecha = models.DateTimeField(blank=True,null=True,default=datetime.datetime.today())
    alerta = models.DateTimeField(blank=True,null=True)
    
  
    class Meta:
        managed = True
        verbose_name = 'Historiaclientesocias'
