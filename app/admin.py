from django.contrib import admin
from app.models import *
from django.contrib.admin import RelatedOnlyFieldListFilter

from django.contrib.admin import AdminSite
from django.utils.translation import ugettext_lazy

from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from PIL import Image
from resizeimage import resizeimage
import os.path
from PIL import Image
from resizeimage import resizeimage
import datetime
from django.contrib import admin
import requests
import json
# Register your models here.

from django.contrib.admin.helpers import ActionForm

from ws4redis.publisher import RedisPublisher
from ws4redis.redis_store import RedisMessage


## Enviando token


## Enviando token





def resize_and_crop(img_path, modified_path, size, crop_type='top'):
	"""
	Resize and crop an image to fit the specified size.
	args:
		img_path: path for the image to resize.
		modified_path: path to store the modified image.
		size: `(width, height)` tuple.
		crop_type: can be 'top', 'middle' or 'bottom', depending on this
			value, the image will cropped getting the 'top/left', 'midle' or
			'bottom/rigth' of the image to fit the size.
	raises:
		Exception: if can not open the file in img_path of there is problems
			to save the image.
		ValueError: if an invalid `crop_type` is provided.
	"""
	# If height is higher we resize vertically, if not we resize horizontally
	img = Image.open(img_path)
	# Get current and desired ratio for the images
	img_ratio = img.size[0] / float(img.size[1])
	ratio = size[0] / float(size[1])
	#The image is scaled/cropped vertically or horizontally depending on the ratio
	if ratio > img_ratio:
		img = img.resize((size[0], size[0] * img.size[1] / img.size[0]),
				Image.ANTIALIAS)
		# Crop in the top, middle or bottom
		if crop_type == 'top':
			box = (0, 0, img.size[0], size[1])
		elif crop_type == 'middle':
			box = (0, (img.size[1] - size[1]) / 2, img.size[0], (img.size[1] + size[1]) / 2)
		elif crop_type == 'bottom':
			box = (0, img.size[1] - size[1], img.size[0], img.size[1])
		else :
			raise ValueError('ERROR: invalid value for crop_type')
		img = img.crop(box)
	elif ratio < img_ratio:
		img = img.resize((size[1] * img.size[0] / img.size[1], size[1]),
				Image.ANTIALIAS)
		# Crop in the top, middle or bottom
		if crop_type == 'top':
			box = (0, 0, size[0], img.size[1])
		elif crop_type == 'middle':
			box = ((img.size[0] - size[0]) / 2, 0, (img.size[0] + size[0]) / 2, img.size[1])
		elif crop_type == 'bottom':
			box = (img.size[0] - size[0], 0, img.size[0], img.size[1])
		else :
			raise ValueError('ERROR: invalid value for crop_type')
		img = img.crop(box)
	else :
		img = img.resize((size[0], size[1]),
				Image.ANTIALIAS)
		# If the scale is the same, we do not need to crop
	img.save(modified_path)

@admin.register(Smsrecibidos)
class SmsrecibidosAdmin(admin.ModelAdmin):
	list_display = ('text','when','sender','receiver')


@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','orden','sexo','visible')
	list_filter=('sexo',)
	list_editable = ('orden','visible','nombre')


	def sexo(self, obj):
		return obj.sexo.nombre

	def save_model(self, request, obj, form, change):
		
		super(CategoriaAdmin, self).save_model(request, obj, form, change)
		
		if Categoria.objects.get(id=obj.id).photo:

			caption = '/home/contactos/'+str(Categoria.objects.get(id=obj.id).photo)

			resize_and_crop(caption, caption, (500,500), crop_type='top')

		if Categoria.objects.get(id=obj.id).photo_home:

			caption = '/home/contactos/'+str(Categoria.objects.get(id=obj.id).photo_home)

			resize_and_crop(caption, caption, (500,150), crop_type='top')


		if Categoria.objects.get(id=obj.id).icono:

			caption = '/home/contactos/'+str(Categoria.objects.get(id=obj.id).icono)

			resize_and_crop(caption, caption, (300,300), crop_type='top')

		if Categoria.objects.get(id=obj.id).icono_seleccionado:

			caption = '/home/contactos/'+str(Categoria.objects.get(id=obj.id).icono_seleccionado)

			resize_and_crop(caption, caption, (300,300), crop_type='top')



@admin.register(Subcategoria)
class SubCategoriaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','categoria','orden','precio','descuento','activar_descuento','duracion_servicio')
	list_editable = ('nombre','orden','precio','descuento','activar_descuento','duracion_servicio')
	list_filter = ('categoria__sexo__nombre','categoria')

	def categoria(self, obj):
		return obj.nombre


	def save_model(self, request, obj, form, change):
			
		super(SubCategoriaAdmin, self).save_model(request, obj, form, change)
		
		if Subcategoria.objects.get(id=obj.id).photo:

			caption = '/home/contactos/'+str(Subcategoria.objects.get(id=obj.id).photo)

			resize_and_crop(caption, caption, (500,150), crop_type='top')

		if Subcategoria.objects.get(id=obj.id).photo_icono:

			caption = '/home/contactos/'+str(Subcategoria.objects.get(id=obj.id).photo_icono)

			resize_and_crop(caption, caption, (200,200), crop_type='top')


@admin.register(Tiponotificacion)
class TiponotificacionAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','plantilla')
	list_editable = ('nombre',)

@admin.register(Tema)
class TemaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')

@admin.register(Personalizar)
class PersonalizarAdmin(admin.ModelAdmin):
	list_display = ('id','logo','nombre')
	help_texts = {'logo': "Imagen 500 x 200",}

@admin.register(Promocodigo)
class PromocodigoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','codigo','estado_compartir')



@admin.register(Portadaphoto)
class PortadaphotoAdmin(admin.ModelAdmin):
	list_display = ('id','sexo','enlace')

	def sexo(self, obj):
		return obj.sexo.nombre


	def save_model(self, request, obj, form, change):
		
		super(PortadaphotoAdmin, self).save_model(request, obj, form, change)
		
		if Portadaphoto.objects.get(id=obj.id).photo:

			caption = '/home/contactos/'+str(Portadaphoto.objects.get(id=obj.id).photo)

			resize_and_crop(caption, caption, (500,150), crop_type='top')



@admin.register(Distrito)
class DistritoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','porcentaje_descuento')
	list_editable = ('porcentaje_descuento',)

def make_published(modeladmin, request, queryset):


	for a in queryset:

		person_email = a.email.lower()

		nombre = a.nombre

		contenido = Configuracion.objects.get(id=1).contenido

		tema  = Configuracion.objects.get(id=1).tema

		email  = Configuracion.objects.get(id=1).email

		imagen1 = str(Configuracion.objects.get(id=1).imagen1)

		imagen1 = 'http://estokealo.com:8000/'+str(Configuracion.objects.get(id=1).imagen1)

		imagen1 = '<img src='+imagen1+'> <br><br><br>'



		imagen2 = 'http://estokealo.com:8000/'+str(Configuracion.objects.get(id=1).imagen2)

		imagen2 = '<img src='+imagen2+'> <br><br><br>'

		imagen3 = 'http://estokealo.com:8000/'+str(Configuracion.objects.get(id=1).imagen3)

		imagen3 = '<img src='+imagen3+'> <br><br><br>'

		subject, from_email, to = tema, email, str('joelunmsm@gmail.com')

		html_content = '<img src="http://aseguratuauto.pe/images/logo-asegura.png"> <br><br><br>'

		#Personalizadno el correo



		html_content = contenido.replace('%nombre%',nombre).replace('%imagen1%',imagen1).replace('%imagen2%',imagen2).replace('%imagen3%',imagen3)

		msg = EmailMultiAlternatives(subject, html_content, email, [person_email])
		#msg.attach_file('/var/www/hermes/out.pdf')
		msg.attach_alternative(html_content, "text/html")
		msg.send()

		print 'msg...',msg

		Trafico(contenido=contenido,email=email,destino=email,fecha=datetime.datetime.now()).save()




make_published.short_description = "Enviar Correo Masivo a seleccionados Plantilla "



@admin.register(Campania)
class CampaniaAdmin(admin.ModelAdmin):
	list_display = ('nombre','fecha','estado','filtro')

	
@admin.register(EnvioMasivo)
class EnvioMasivoAdmin(admin.ModelAdmin):
	list_display = ('campania','dni','origen','nombre','telefono','distrito','sexo','email','edad')
	list_filter = ('campania',)
	search_fields = ('nombre','dni',)



@admin.register(Personas)
class PersonasAdmin(admin.ModelAdmin):
	list_display = ('dni','origen','nombre','telefono','distrito','sexo','email','edad')
	list_filter = ('sexo','distrito','edad')
	search_fields = ('nombre','dni',)
	actions = [make_published]

@admin.register(Publicidad)
class PublicidadAdmin(admin.ModelAdmin):
	list_display = ('id','nombre','photo','enlace','sexo')
	list_editable=('enlace','sexo')

@admin.register(Trafico)
class TraficoAdmin(admin.ModelAdmin):
	list_display = ('id','contenido')
	change_list_template = 'admin/change_list.html'

@admin.register(TraficoSMS)
class TraficoSMSAdmin(admin.ModelAdmin):
	list_display = ('id','telefono','mensaje')






@admin.register(Configuracion)
class ConfiguracionAdmin(admin.ModelAdmin):
	list_display = ('id','contenido')


@admin.register(Estadocompartir)
class EstadocompartirAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')



@admin.register(Sexo)
class SexoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')



@admin.register(Estado)
class EstadoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')
	list_editable = ('nombre',)

@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
	list_display = ('id','email','telefono','get_user')
	search_fields = ('email','user__username','numero_notificacion')

	def get_user(self, obj):

		if obj.user:

			return obj.user.username
		else:
			return 'No tiene'



@admin.register(Dia)
class DiaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')


# 	def tipo(self, obj):
# 		return obj.tipo_notificacion.nombre


# 	def cliente(self, obj):
# 		return obj.cliente.nombre

@admin.register(Fotos)
class FotossociaAdmin(admin.ModelAdmin):
	list_display = ('id','foto')
	list_editable = ('foto',)


@admin.register(Sociacategoriaphoto)
class SociacategoriaphotoAdmin(admin.ModelAdmin):
	list_display = ('id','photo')


@admin.register(Sociacomentario)
class SociacomentarioAdmin(admin.ModelAdmin):
	list_display = ('id','socia','cliente')


# @admin.register(Distrito)
# class DistritoAdmin(admin.ModelAdmin):
# 	list_display = ('id','nombre')
# 	list_editable = ('nombre',)

@admin.register(Socia)
class SociaAdmin(admin.ModelAdmin):
	list_display = ('id','estrellas','user','nombre','apellido','dni','telefono','email','distrito','numero_notificacion','texperiencia','estado_socia')
	list_filter= ('estado_socia',)
	list_editable=('estrellas',)
	search_fields=('user__email',)
	actions=['enviar_notificacion']

	def enviar_notificacion(self, request, queryset):

		for obj in queryset:

			header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
			payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [obj.numero_notificacion],"contents": {"en": "Esto es una prueba de notificacion"},"data":{'codigo': '123'}}
			req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		
		return '0'

	def save_model(self, request, obj, form, change):
		
		super(SociaAdmin, self).save_model(request, obj, form, change)
		
		if Socia.objects.get(id=obj.id).photo:

			caption = '/home/contactos/'+str(Socia.objects.get(id=obj.id).photo)

			resize_and_crop(caption, caption, (300,300), crop_type='top')



@admin.register(Sociasubcategoria)
class SociasubcategoriaAdmin(admin.ModelAdmin):
	list_display = ('id','socia','subcategoria','categoria','validar')
	list_filter=('socia__nombre','subcategoria__categoria__nombre','subcategoria__nombre')
	list_editable=('validar',)

	
	def socia(self, obj):
		return obj.socia.nombre

	def subcategoria(self, obj):
		return obj.subcategoria.nombre

	def categoria(self, obj):
		return obj.subcategoria.categoria.nombre


@admin.register(Sociacategoria)
class SociacategoriaAdmin(admin.ModelAdmin):
	list_display = ('id','socia','categoria','validar')

	
# @admin.register(Opcion)
# class OpcionAdmin(admin.ModelAdmin):
# 	list_display = ('id','sociasubcategoria','nombre')

	
# 	def sociasubcategoria(self, obj):
# 		return str(obj.sociasubcategoria.socia.nombre)+str(obj.sociasubcategoria.subcategoria.nombre)

@admin.register(Turnosocia)
class TurnosociaAdmin(admin.ModelAdmin):
	list_display = ('id','socia','fecha_inicio','fecha_fin','dia')
	list_filter=('socia__nombre','dia')

	

	def socia(self, obj):
		return obj.socia.nombre


@admin.register(Clientesocias)
class ClientessociasAdmin(admin.ModelAdmin):
	list_display = ('id','cliente','socia')

	
	def cliente(self, obj):
		return obj.cliente.nombre

	def socia(self, obj):
		return obj.socia.nombre


@admin.register(Sociadistrito)
class SociadistritoAdmin(admin.ModelAdmin):
 	list_display = ('socia','distrito')


	
# 	def socia(self, obj):
# 		return obj.socia.nombre

# 	def distrito(self, obj):
# 		return obj.distrito.nombre



@admin.register(Servicio)
class ServicioAdmin(admin.ModelAdmin):
	list_display = ('id','get_cliente','estado')
	list_filter = ('estado__nombre','socia__nombre','cliente__nombre')
	exclude = ('socia','dia','estado','token','latitud','longitud','pago','fecha_pago')



	# actions=['enviar_notificacion']

	# def enviar_notificacion(self, request, queryset):

	# 	for obj in queryset:

	# 		print obj.cliente.nombre

	# return None

	def get_cliente(self, obj):

		## Enviando token


		return obj.cliente.nombre
	# def socia(self, obj):
	# 	return obj.socia.nombre







@admin.register(Serviciosintentos)
class ServiciosintentosAdmin(admin.ModelAdmin):
	list_display = ('id','detalle_servicio','cliente','socia','fecha','detalle','estado')
	list_filter=('servicio',)

	def detalle_servicio(self, obj):
		ser = ' '
		for se in Serviciopedido.objects.filter(servicio_id=obj.servicio.id):
			ser  = ser +' / '+se.subcategoria.nombre

		return str(obj.servicio.id) +' - '+ser

	def cliente(self, obj):
		return obj.servicio.cliente.nombre
	def socia(self, obj):
		return obj.socia.nombre
	def estado(self, obj):
		return obj.servicio.estado.nombre






@admin.register(Serviciopedido)
class ServiciopedidoAdmin(admin.ModelAdmin):
	list_display = ('servicio','socia','cliente','categoria','subcategoria','estado','fecha','hora','telefono')
	list_filter=('servicio__socia__nombre','servicio__estado','servicio')


	def save_model(self, request, obj, form, change):


		print 'obj.id...',obj.id,request

		if obj.id == None:

			id_ser = int(Serviciopedido.objects.all().values('id').order_by('-id')[0]['id'])+1

		else:

			id_ser=obj.id

		_ser = Servicio.objects.get(id=obj.servicio.id)
		_ser.estado_id=2
		_ser.save()




		
		
		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [obj.socia.numero_notificacion],"contents": {"en": "Tienes un nuevo servicio requerido"},"data":{'servicio': str(id_ser)}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)


		super(ServiciopedidoAdmin, self).save_model(request, obj, form, change)

	
	def categoria(self, obj):
		return obj.subcategoria.categoria.nombre

	def sociasubcategoria(self, obj):
		return obj.subcategoria.nombre

	def telefono(self, obj):
		if obj.servicio:

			return obj.servicio.cliente.telefono


	def cliente(self, obj):
		if obj.servicio:

			return obj.servicio.cliente.nombre


	# def socia(self, obj):
	# 	if obj.servicio:

	# 		if obj.servicio.socia:
	# 			return obj.servicio.socia.nombre
	# 		else:
	# 			return 'Por Asignar'
	# 	else:
	# 		return 'no existe servicio'	

	def estado(self, obj):
		if obj.servicio:


			if obj.servicio.estado:
				return obj.servicio.estado.nombre
			else:
				return 'Sin estado'

	def fecha(self, obj):
		if obj.servicio:

			return obj.servicio.fecha

	def hora(self, obj):
		if obj.servicio:
	
			return obj.servicio.fecha_inicio



# @admin.register(Pais)
# class PaisAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(EstadoCivil)
# class EstadoCivilAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Modalidad)
# class ModalidadAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Nivel)
# class NivelAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre','descripcion')
#     list_editable = ('nombre',)

# @admin.register(TipoAgente)
# class TipoAgenteAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Grupo)
# class GrupoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Subgrupo)
# class SubgrupoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Compania)
# class CompaniaAgenteAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Producto)
# class ProductoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Ramo)
# class RamoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(TipoCita)
# class TipoCitaAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(TipoSeguimiento)
# class TipoSeguimientoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Relacion)
# class RelacionAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Equipo)
# class EquipoAdmin(admin.ModelAdmin):
#     list_display = ('id','nombre')
#     list_editable = ('nombre',)

# @admin.register(Semanas)
# class SemanasAdmin(admin.ModelAdmin):
#     list_display = ('id','numero','fecha_inicio','fecha_fin','anio')



# @admin.register(Agente)
# class AgenteAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_estructura','get_user','get_tipo_agente','meta_personal','meta_requerida','fecha_ingreso','correo_capital','photo')
# 	list_editable = ('meta_personal',)


# 	def save_model(self, request, obj, form, change):
		
# 		super(AgenteAdmin, self).save_model(request, obj, form, change)
		

# 		# caption = '/home/capital_back/'+str(Agente.objects.get(id=obj.id).photo)
# 		# fd_img = open(caption, 'r')
# 		# img = Image.open(fd_img)
# 		# width, height = img.size
# 		# img = resizeimage.resize_cover(img, [300, 300])
# 		# img.save(caption, img.format)
# 		# fd_img.close()
	
# 	def get_user(self, obj):

# 		if obj.user:
# 			return obj.user.username
# 		else:
# 			return ''

# 	def get_tipo_agente(self, obj):

# 		if obj.tipo_agente:
# 			return obj.tipo_agente.nombre
# 		else:
# 			return ''
# 	def get_estructura(self, obj):
		
# 		if obj.estructura:
# 			return obj.estructura.nombre
# 		else:
# 			return ''


# @admin.register(Cliente)
# class ClienteAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_user','fecha_inicio','estado_civil','numero_hijos')
# 	list_editable = ('estado_civil',)

# 	def get_user(self, obj):
# 		return obj.user.username

# @admin.register(Citas)
# class CitasAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_cliente','get_agente','get_tipo_cita','get_propuesta_cliente','get_tipo_seguimiento','fecha_cita','fecha_creacion','prima_target','inforce')
# 	list_filter = ('tipo_seguimiento__nombre','tipo_cita__nombre','agente__user__username')
# 	list_editable = ('inforce',)

# 	def get_agente(self, obj):
# 		return obj.agente.user.first_name

# 	def get_tipo_cita(self, obj):
# 		return obj.tipo_cita.nombre

# 	def get_cliente(self, obj):
# 		return obj.cliente.user.first_name


# 	def get_propuesta_cliente(self, obj):
# 		return obj.propuesta_cliente.ramo_compania_producto.ramo.nombre

# 	def get_tipo_seguimiento(self, obj):
# 		return obj.tipo_seguimiento.nombre




# @admin.register(ParientesCliente)
# class ParientesClienteAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_cliente','nombre','edad','relacion')
	

# 	def get_cliente(self, obj):
# 		return obj.cliente.user.username


# @admin.register(PropuestaCliente)
# class PropuestaClienteAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_cliente','get_agente','get_ramo','observacion','fecha','detalle','inforce')
# 	list_editable = ('inforce',)
	
# 	def get_cliente(self, obj):
# 		return obj.cliente.user.username

# 	def get_agente(self, obj):
# 		return obj.agente.user.username

# 	def get_ramo(self, obj):
# 		return obj.ramo_compania_producto.ramo.nombre + ' / ' + obj.ramo_compania_producto.compania.nombre +' / '+obj.ramo_compania_producto.producto.nombre

# @admin.register(RamoCompaniaProducto)
# class RamoCompaniaProductoAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_ramo','get_compania','get_producto')
	
# 	def get_ramo(self, obj):
# 		return obj.ramo.nombre

# 	def get_compania(self, obj):
# 		return obj.compania.nombre

# 	def get_producto(self, obj):
# 		return obj.producto.nombre


# # class DatosInline(admin.StackedInline):
# #     model = DatosUsuario
# #     can_delete = False


# # # Define a new User admin
# # class UserAdmin(BaseUserAdmin):
# #     inlines = (DatosInline, )

# # # Re-register UserAdmin
# # admin.site.unregister(User)
# # admin.site.register(User, UserAdmin)



# @admin.register(TelefonoUser)
# class TelefonoUserAdmin(admin.ModelAdmin):
# 	list_display = ('id','get_user','numero')
	
# 	def get_user(self, obj):
# 		return obj.user.username


# @admin.register(Iconos)
# class IconosAdmin(admin.ModelAdmin):
# 	list_display = ('id','nombre','icono')
	



# @admin.register(AuthUser)
# class AuthUserAdmin(admin.ModelAdmin):
# 	list_display = ('id','pais','get_equipo','username','first_name','last_name','get_nivel','get_grupo','get_subgrupo','correo_capital','email','nacimiento','telefono','direccion','dni','contacto','relacion','movil_contacto','fecha_ingreso')
# 	#list_editable = ('email',)
# 	search_fields = ('first_name',)
# 	list_filter = ('nivel__nombre','equipo__nombre')





# 	def save_model(self, request, obj, form, change):



# 		if Agente.objects.filter(user_id=obj.id):

# 			age_obj = Agente.objects.get(user_id=obj.id)
# 			age_obj.equipo=obj.equipo
# 			age_obj.tipo_agente_id=obj.tipo_agente
# 			age_obj.meta_personal=obj.meta_personal
# 			age_obj.meta_requerida=obj.meta_requerida
# 			age_obj.fecha_ingreso=obj.fecha_ingreso
# 			age_obj.correo_capital=obj.correo_capital
# 			age_obj.photo=obj.photo
# 			age_obj.save()

# 		else:

# 			print 'nivel',obj.nivel

# 			if obj.nivel:

# 				if obj.nivel.nombre!='Cliente':


# 					if obj.tipo_agente:

# 						id_tipo_agente = obj.tipo_agente.id

# 					else:

# 						id_tipo_agente = None


# 					Agente(photo=obj.photo,user_id=obj.id,tipo_agente_id=id_tipo_agente,meta_requerida=obj.meta_requerida,meta_personal=obj.meta_requerida,fecha_ingreso=obj.fecha_ingreso,correo_capital=obj.correo_capital,equipo=obj.equipo).save()

# 		super(AuthUserAdmin, self).save_model(request, obj, form, change)

# 		caption = '/home/capital_back/'+str(AuthUser.objects.get(id=obj.id).photo)

# 		if os.path.isfile(caption):
		
# 			fd_img = open(caption, 'r')
# 			img = Image.open(fd_img)
# 			width, height = img.size
# 			img = resizeimage.resize_cover(img, [300, 300])
# 			img.save(caption, img.format)
# 			fd_img.close()


# 	def get_nivel(self, obj):

# 		if obj.nivel:
# 				return obj.nivel.nombre
# 		else:
# 				return ''
# 	get_nivel.short_description = 'Nivel'
# 	get_nivel.admin_order_field = 'equipo_id'

# 	def get_grupo(self, obj):

# 		if obj.grupo:
# 				return obj.grupo.nombre
# 		else:
# 				return ''
# 	get_grupo.short_description = 'Grupo'
# 	get_grupo.admin_order_field = 'equipo_id'

# 	def get_subgrupo(self, obj):

# 		if obj.subgrupo:
# 				return obj.subgrupo.nombre
# 		else:
# 				return ''
# 	get_subgrupo.short_description = 'Subgrupo'
# 	get_subgrupo.admin_order_field = 'equipo_id'


# 	def get_equipo(self, obj):

# 		if obj.equipo:
# 				return obj.equipo.nombre
# 		else:
# 				return ''

# 	get_equipo.short_description = 'Equipo'
# 	get_equipo.admin_order_field = 'equipo_id'



