#!/usr/bin/env python
# -*- coding: utf-8 -*-

#    ___       ___       ___       ___            ___       ___   
#   /\  \     /\__\     /\  \     /\__\          /\  \     /\  \  
#  /  \  \   / | _|_   /  \  \   |  L__L        _\ \  \   /  \  \ 
# /  \ \__\ /  |/\__\ / /\ \__\  |   \__\      /\/  \__\ / /\ \__\
# \/\  /  / \/|  /  / \ \/ /  /  /   /__/      \  /\/__/ \ \/ /  /
#   / /  /    | /  /   \  /  /   \/__/          \/__/     \  /  / 
#   \/__/     \/__/     \/__/                              \/__/

# email : rossestrella031@gmail.com
# web   : xiencias.com



from django.shortcuts import *
from django.template import RequestContext
from django.contrib.auth import *
from django.views.generic import View
from django.contrib.auth.models import Group, User
from django.core import serializers
from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.models import Group, User
from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin
from django.template import RequestContext
import simplejson
from django.views.decorators.csrf import csrf_exempt
import xlrd
from django.db.models import Count,Sum,Max
from app.models import *
from app.serializers import *

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer

from django.contrib.auth import authenticate
import time
from django.db.models import Func
import os
from datetime import datetime,timedelta,date
import os.path
import requests
import smtplib
from email.mime.text import MIMEText

import datetime
import random
from django.db.models import Count,Sum
from PIL import Image
from resizeimage import resizeimage
from django.core.mail import EmailMultiAlternatives
from django.contrib.admin.views.decorators import staff_member_required
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect
import operator
from django.db.models import Q

import datetime
import requests
import json
import time
import uuid
import culqipy
import math
import string
import random
from django_slack import slack_message
from ws4redis.publisher import RedisPublisher
from ws4redis.redis_store import RedisMessage
from twilio.rest import Client
import random
from app.serializer import *


def websocket(request):
	return render(request, 'prueba.html',{})


def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    

    return ''.join(random.choice(chars) for _ in range(size))



def reporte(request):
    return render_to_response(
        "admin/change.form.html",
        {'book_list' : Trafico.objects.annotate(conteo=Count('destino')),'monto' : Trafico.objects.all().count()*0.1,'cantidad':Trafico.objects.all().count()},
        RequestContext(request, {}),
    )

reporte = staff_member_required(reporte)


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


@csrf_exempt
def mifoto(request):

	if request.method=='POST':


		archivo = str(request.FILES['photo'])

		archivo=  archivo.split('mascojudo')

		id_cliente = archivo[1]


		cli = Cliente.objects.get(id=id_cliente)
		cli.photo=request.FILES['photo']
		cli.save()

		Socia.objects.filter(telefono=cli.telefono).update(photo='static/'+str(request.FILES['photo']))




	data= simplejson.dumps('ok')

	return HttpResponse(data, content_type="application/json")


@csrf_exempt
def subirfoto(request):

	if request.method=='POST':

		print 'photo',request.FILES

		print 'eueueu............'

		archivo = str(request.FILES['photo'])

		archivo=  archivo.split('_mascojudo_')

		print archivo

		cat = archivo[1]

		phone = archivo[2].split('.')[0]

		id_socia=Socia.objects.get(user__username=phone).id

		#archivo.split('-')[1]

		Sociacategoriaphoto(photo=request.FILES['photo'],socia_id=id_socia,categoria_id=cat).save()

	data= simplejson.dumps('ok')

	return HttpResponse(data, content_type="application/json")

@csrf_exempt
def enviasms(request,telefono):

	a = random.randint(0, 5)	
	b = random.randint(0,9)
	c = random.randint(0,9)
	
	c= simplejson.dumps(str(a)+str(b)+str(c))

	c=c.split('"')[1]

	contenido='Se le envio un SMS con el codigo de confirmacion'

	data ={'contenido':contenido,'codigo':c}


	numero=telefono

	phone_number=telefono

	mensaje= c+' es tu codigo My Look Xpress'

	audience = {numero:mensaje}

	if phone_number[:2] != '51' and len(phone_number)==9:

		phone_number = '51%s' % phone_number

	tra = TraficoSMS.objects.filter(telefono=phone_number,fecha__gt=datetime.date.today()).order_by('-id')

	#if tra.count()==0:

	dato = infobip(audience,c)

	# else:

	# 	contenido = 'Revise su SMS, le enviamos un codigo de confirmacion'
	# 	tra[0].mensaje=tra[0].mensaje.replace('"','')   
	# 	c=simplejson.dumps(str(tra[0].mensaje.split(' ')[0]))

	# 	c=c.split('"')[1]

	# 	data ={'contenido':contenido,'codigo':c}

	# account_sid = "ACf1737cb2d490ef11617020336a4ba812"
	
	# auth_token  = "d366b114e76a84c4ab0bd8e4de7d28ad"

	# client = Client(account_sid, auth_token)

	# message = client.messages.create(
	#      to="+51"+str(telefono), 
	#      from_="+17162295779",
	#      body="My Look Xpress tu codigo es "+c)

	# account_sid = "AC417d59d278e0b6d66baf89abcb6eb4a9"

	# auth_token  = "f2d4790325c3698911c66449c8c4e497"

	# client = Client(account_sid, auth_token)

	# message = client.messages.create(
	#     to="+51"+str(telefono), 
	#     from_="+12016543532",
	#     body="My Look Xpress tu codigo es "+c)

	data= simplejson.dumps(data)

	return HttpResponse(data, content_type="application/json")


@csrf_exempt
def prueba(request):


	sub = Subcategoria.objects.all()

	for s in sub:

		Sociasubcategoria(socia_id=1,subcategoria_id=s.id).save()

	# # Your Account SID from twilio.com/console
	# account_sid = "ACf1737cb2d490ef11617020336a4ba812"
	# # Your Auth Token from twilio.com/console
	# auth_token  = "d366b114e76a84c4ab0bd8e4de7d28ad"

	# client = Client(account_sid, auth_token)

	# message = client.messages.create(
	#     to="+51980729169", 
	#     from_="+17162295779",
	#     body="Hello from Python!")

	# print(message.sid)

	# redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

	# message = RedisMessage('false')

	# # and somewhere else
	
	# redis_publisher.publish_message(message)

	c= Categoria.objects.all().values('id','nombre','photo')

	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")

@csrf_exempt
def fotos(request):


	c= Fotos.objects.all().values('id','foto')

	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")

@csrf_exempt
def recibetoken(request):

	if request.method=='POST':

		token= json.loads(request.body)['token']

		id_servicio = json.loads(request.body)['codigo_servicio']

		precio = json.loads(request.body)['precio']

		ser = Servicio.objects.get(id=id_servicio)

		email = ser.cliente.email

		ser.estado_id=7
		ser.token=token
		ser.pago=int(precio)
		ser.fecha_pago=datetime.datetime.today()
		ser.save()

		precio = int(precio)*100

		Serviciopago(servicio_id=id_servicio,pago=precio,fecha=datetime.datetime.today()).save()

		headers = {'Content-type': 'application/json', 'Authorization':'Bearer sk_test_0R0Ik7VbS6NKV7TD'}

		data = {"currency_code": "PEN",'amount': precio , "email":email,"capture": True, 'country_code': 'PE','installments':0, "source_id": token}

		url= 'https://api.culqi.com/v2/charges'

		r = requests.post(url, data=json.dumps(data), headers=headers)

		c= simplejson.dumps('OK')

		return HttpResponse(c, content_type="application/json")





@csrf_exempt
def loginfacebook(request):

	if request.method=='POST':

		user = json.loads(request.body)


		url=None
		gender=None
		name=None
		email= None
		telefono=None

		for tel in user:

			if tel=='telefono':

				telefono=user['telefono']


		for x in user['users']:

			print x

			if x=='picture': url= user['users']['picture']['data']['url']
			if x=='gender':  gender = user['users']['gender']
			if x=='name': name = user['users']['name']
			if x=='email': email = user['users']['email']

		# url = user['users']['picture']['data']['url']
		# gender = user['users']['gender']
		# name = user['users']['name']
		# email = user['users']['email']
		id_face = user['users']['id']

		if User.objects.filter(username=id_face).count()>0:

			print 'Ya existe'

			x = {'email':id_face,'id_face':id_face,'gender':'rosa0000'}
			#x = {'email':email,'id_face':id_face}


			c= simplejson.dumps(x)



			return HttpResponse(c, content_type="application/json")

		User.objects.create_user(id_face, id_face, id_face+'rosa0000')

		id_user = User.objects.all().values('id').order_by('-id')[0]['id']

		u = User.objects.get(id=id_user)
		u.first_name= name

		u.save()

		group = Group.objects.get(name='Cliente')

		u.groups.add(group)

		codigo_compartir = id_generator(8,string.ascii_lowercase)

		if Socia.objects.filter(codigo_compartir=codigo_compartir).count()>0:

			codigo_compartir = id_generator(8,string.ascii_lowercase)

		#Cliente(telefono=telefono,nombre=name,user_id=id_user,email=email,photo_facebook=url,sexo=gender,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()
		
		Cliente(nombre=name,user_id=id_user,email=email,photo_facebook=url,sexo=gender,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()
				
		user = authenticate(username=id_face, password=id_face+'rosa0000')
		login(request, user)

		x = {'email':id_face,'id_face':id_face,'gender':'rosa0000'}

		
		c= simplejson.dumps(x)

		return HttpResponse(c, content_type="application/json")


class Panico(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def get(self, request):

		id=request.user.id
		_socia = Socia.objects.get(user_id=id)

		_f = Cliente.objects.get(email='rossestrella031@gmail.com').numero_notificacion


	 	header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
	 	payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [_f],"contents": {"en": "La socia "+_socia.nombre+" presiono el boton de panico"}}
	 	req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))

	 	print req

		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def eliminaservicio(request,id):

	Servicio.objects.filter(id=id).update(eliminado=1)

	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")

@csrf_exempt
def mitema(request):

	t=Personalizar.objects.filter(id=2).values('tema__nombre','logo','nombre')

	c= simplejson.dumps(ValuesQuerySetToDict(t))

	return HttpResponse(c, content_type="application/json")



@csrf_exempt
def registro(request):

	os.system('/bin/sh /home/backmylook/devices.sh')

	print 'data...',json.loads(request.body)

	telefono=None

	username= json.loads(request.body)['email']

	password= json.loads(request.body)['password']

	nombre= json.loads(request.body)['nombre']

	#telefono= json.loads(request.body)['telefono']

	if User.objects.filter(username=username).count()>0:

		c= simplejson.dumps(0)

		return HttpResponse(c, content_type="application/json")

	User.objects.create_user(username, username, password)

	id_user = User.objects.all().values('id').order_by('-id')[0]['id']

	u = User.objects.get(id=id_user)

	u.first_name= json.loads(request.body)['nombre']


	u.save()

	group = Group.objects.get(name='Cliente')

	u.groups.add(group)

	codigo_compartir = id_generator(8,string.ascii_lowercase)

	if Socia.objects.filter(codigo_compartir=codigo_compartir).count()>0:

		codigo_compartir = id_generator(8,string.ascii_lowercase)

	Cliente(nombre=nombre,user_id=id_user,email=username,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()

	id_cliente = Cliente.objects.all().values('id').order_by('-id')[0]['id']

	Promocodigo(cliente_id=id_cliente,codigo=codigo_compartir,descuento=5,nombre='Promocion Gana 5 soles descuento por compartir la app').save()

	#Cliente(telefono=telefono,nombre=nombre,user_id=id_user,email=username,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()

	user = authenticate(username=username, password=password)

	login(request, user)

	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")



@csrf_exempt
def validauser(request):

	telefono= json.loads(request.body)['cliente']['cliente']

	codigosms=json.loads(request.body)['cliente']['codigosms']



	if User.objects.filter(username=telefono).count()>0:

		if telefono[:2] != '51' and len(telefono)==9:

			telefono = '51%s' % telefono

		# if TraficoSMS.objects.filter(codigo=codigosms,telefono=telefono).count()>0:

		# 	c= simplejson.dumps(0)

		# 	return HttpResponse(c, content_type="application/json")

		c= simplejson.dumps('Ya valido codigo')

		return HttpResponse(c, content_type="application/json")

	else:


		_cli= Cliente.objects.filter(telefono=telefono)

		if _cli.count()>0:

			u=_cli[0].user
			u.username=telefono
			u.set_password('rosa0000')
			u.save()

		c= simplejson.dumps(1)

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def registro_v2(request):

	os.system('/bin/sh /home/backmylook/devices.sh')

	print 'data...',json.loads(request.body)

	
	username= json.loads(request.body)['username']

	if User.objects.filter(username=username).count()>0:

		c= simplejson.dumps(0)

		return HttpResponse(c, content_type="application/json")


	telefono=json.loads(request.body)['username']


	email= json.loads(request.body)['email']

	password= json.loads(request.body)['password']

	nombre= json.loads(request.body)['nombre']

	# apellido= json.loads(request.body)['apellido']

	#telefono= json.loads(request.body)['telefono']


	User.objects.create_user(username, username, password)

	id_user = User.objects.all().values('id').order_by('-id')[0]['id']

	u = User.objects.get(id=id_user)

	u.first_name= json.loads(request.body)['nombre']


	u.save()

	group = Group.objects.get(name='Cliente')

	u.groups.add(group)

	codigo_compartir = id_generator(8,string.ascii_lowercase)

	if Socia.objects.filter(codigo_compartir=codigo_compartir).count()>0:

		codigo_compartir = id_generator(8,string.ascii_lowercase)

	Cliente(telefono=telefono,nombre=nombre,user_id=id_user,email=email,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()

	id_cliente = Cliente.objects.all().values('id').order_by('-id')[0]['id']

	Promocodigo(cliente_id=id_cliente,codigo=codigo_compartir,descuento=5,nombre='Promocion Gana 5 soles descuento por compartir la app',estado_compartir_id=1).save()


	#Cliente(telefono=telefono,nombre=nombre,user_id=id_user,email=username,codigo_compartir=codigo_compartir,fecha_inscripcion=datetime.datetime.today(),estado_compartir_id=1).save()

	user = authenticate(username=username, password=password)

	login(request, user)

	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")

@csrf_exempt
def enviaemail(request):



	subject, from_email, to = 'Titulo', 'My Look Xpress <info@mylookxpress.com>', 'joelunmsm@gmail.com'

	text_content = 'Existen socias para este pedido pero no esta disponibles en este horario porfavor solucionar: '

	text_content= text_content+'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='

	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])

	msg.send()

	return HttpResponse('OK', content_type="application/json")



def enviacorreo(subject,contenido,destino):

	subject, from_email, to = subject, 'My Look Xpress <info@mylookxpress.com>', destino

	text_content = contenido

	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])

	msg.send()

	return HttpResponse('OK', content_type="application/json")



@csrf_exempt
def smsrecibidos(request):


    f = open('/var/www/codigito.com/public_html/recibidos.txt', 'a')
    f.write(str(request.GET)+'\n')
    f.close()
    text = request.GET['text']
    when = request.GET['when']
    sender = request.GET['sender']
    receiver = request.GET['receiver']
    Smsrecibidos(text=text,when=when,sender=sender,receiver=receiver).save()

    return HttpResponse('OK', content_type="application/json")

@csrf_exempt
def buscasociatareaprogramada(request):

	ser = Servicio.objects.filter(estado__id__in=[3,6]) #Confirmado, Cancelo Socia

	print 'Cantidad a procesar',ser.count()

	for s  in ser :

		print s.id

		sociascate=None

		pedidos =[]

		pedidos_nombre =[]

		ped = Serviciopedido.objects.filter(servicio_id=s.id)

		for p in ped:

			print 'entre a pedidos'

			pedidos.append(p.subcategoria.id)

			pedidos_nombre.append(p.subcategoria.nombre)

		if s.socia:

			if s.socia.latitud:

				latitud = float(s.socia.latitud)

				longitud = float(s.socia.longitud)

			else:

				latitud=-12

				longitud=-76

		else:
			
			latitud=-12

			longitud=-76

		hora_reserva = s.fecha_inicio

		dia =s.dia.nombre

		#socia_actual = s.socia.id

		print 'Datos de servicio :',s.id ,hora_reserva,pedidos_nombre,s.socia,s.estado.nombre,s.cliente.nombre

		# dia = s.dia

		# if dia=='Sabado':ndia=6
		# if dia=='Viernes':ndia=5
		# if dia=='Jueves':ndia=4
		# if dia=='Miercoles':ndia=3
		# if dia=='Martes':ndia=2
		# if dia=='Lunes':ndia=1
		# if dia=='Domingo':ndia=7

		if len(pedidos)>0:


			#Asignando y Calculando distancias

			##Posicion del cliente


			#latitud_cliente = float(s.latitud)

			#longitud_cliente = float(s.longitud)

			# dis = haversine(latitud_cliente,longitud_cliente,latitud,longitud)

			# soc = Socia.objects.get(id=s.socia.id)

			# soc.distancia = dis

			# soc.save()

			intentos = []

			for i in Serviciosintentos.objects.filter(servicio_id=s.id):

				intentos.append(i.socia.id)

			query = reduce(operator.and_, (Q(subcategoria__id__contains = item) for item in pedidos))
			
			sociascate=Sociasubcategoria.objects.filter(query).exclude(socia__in=intentos).order_by('socia__distancia')

			#sociascate=Sociasubcategoria.objects.filter(query).order_by('socia__distancia')



			print 'Numeros de Socias Encontradas..',sociascate.count()



			# if sociascate.count()==0:


			# 	print 'No se encontro socias...'

			# 	serv = Servicio.objects.get(id=s.id)
			# 	serv.estado_id=5
			# 	serv.save()

			# 	Serviciosintentos(servicio_id=s.id,socia_id=1,detalle='No se encontro ninguna socia',fecha=datetime.datetime.today()).save()

			# 	subject, from_email, to = 'My Look Xpress', 'info@mylookxpress.com', 'rossestrella031@gmail.com'
			# 	text_content = 'Una cliente nueva no encontro una socia, porfavor apoyarle, en el siguiente link detalle su informacion: '
			# 	text_content= text_content+'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(s.id)
			# 	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
			# 	msg.send()




		contador = 0

		##Guarda pedidos subcategorias



		if sociascate:

			for so in sociascate:


				serv = Servicio.objects.get(id=s.id)
				serv.socia_id=so.socia.id
				serv.save()

				Serviciosintentos(servicio_id=s.id,socia_id=so.socia.id,detalle='Socia encontrada',fecha=datetime.datetime.today()).save()

				id_servint = Serviciosintentos.objects.all().values('id').order_by('-id')[0]['id']

				t = Turnosocia.objects.filter(socia_id=so.socia.id,fecha_inicio__lte=hora_reserva,fecha_fin__gte=hora_reserva,dia__nombre=dia)

				### Envia notificacion a la socia

				if t.count()>0:

					contador=contador+1

					print 'Enviando a Socia encontrada en el Turno..',so.socia.nombre,so.socia.numero_notificacion

					

					if so.socia.numero_notificacion:

						print 'Enviando notificacion...'

						header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
						payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [so.socia.numero_notificacion],"contents": {"en": "Tienes un nuevo servicio requerido"},"data":{'servicio': s.id}}
						req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
						print(req.status_code, req.reason)

						si = Serviciosintentos.objects.get(id=id_servint)
						si.detalle='Se envio notificacion a la socia'
						si.fecha=datetime.datetime.today()
						si.save()


						Serviciopedido.objects.filter(servicio_id=s.id).update(socia_id=so.socia.id)
						

					else:

						if so.socia.email:

							subject, from_email, to = 'My Look Xpress', 'info@mylookxpress.com', so.socia.email
							text_content = 'Tienes un nuevo servicio con codigo '+str(s.id)+' requerido porfavor revisar la aplicacion: '
							msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
							msg.send()

							si = Serviciosintentos.objects.get(id=id_servint)
							si.detalle='Se envio email a la socia'
							si.fecha=datetime.datetime.today()
							si.save()


				else:

					print 'No esta disponible en esta hora'

					si = Serviciosintentos.objects.get(id=id_servint)
					si.detalle='No esta disponible en estas fechas'
					si.fecha = datetime.datetime.today()
					si.save()

				break




						

			print '---------'




	return HttpResponse('OK', content_type="application/json")


def infobip(audience,codigo):

    url ="https://api.infobip.com/sms/1/text/single"
    username = 'AFCA001'
    password = 'rosa0000'
    headers = {'Content-type': 'application/json', 'Accept': 'text/json','Authorization':'Basic QUZDQTAwMTpyb3NhMDAwMA=='}

    for recipient in audience:
        
        phone_number = recipient

        message = audience[recipient]
        
        if phone_number[:2] != '51' and len(phone_number)==9:

            phone_number = '51%s' % phone_number

        data = {'to':phone_number,'text':message}


    
        r = requests.post(url, data=json.dumps(data), headers=headers)

        result1 = r.text.strip()

        result= json.loads(result1)
    
        reference= str(result['messages'][0]['status']['description'])

        TraficoSMS(telefono=phone_number,mensaje=message,referencia=reference,codigo=codigo).save()

        grupo = result['messages'][0]['status']['groupId']

        if grupo == int(0):
            error = 0
            status =1

        if grupo == int(5) or grupo ==int(1) or grupo==int(2) or grupo==int(3) or grupo ==int(4):
            error =1
            status= 0


    return reference

@csrf_exempt
def asignanotificacion(request):


	os.system('/bin/sh /home/backmylook/devices.sh')

	archivo = open("/home/backmylook/data.txt", 'r') 

	i=0

	for linea in archivo.readlines():
		i=i+1
		if int(i)==22:     
			t=linea

	player = json.loads(t)['players']

	onesignal_player_ids = []

	lista_clientes_id = []

	faltantes =[]

	##Lista modelos

	for p in player:

		modelo = p['device_model']

		version = p['device_os']

		cl = Cliente.objects.filter(modelo_celular=modelo,version_celular=version)

		if cl.count()>0:

			print 'Guardando'

			for s in cl:

				s.numero_notificacion = p['id']
				s.save()

		soc = Socia.objects.filter(modelo_celular=modelo,version_celular=version)

		if soc.count()>0:

			print 'Guardando'

			for s in soc:

				s.numero_notificacion = p['id']

				s.save()




	# 	onesignal_player_ids.insert(1,p['id']) 

	# for _cli in Cliente.objects.all():

	# 	lista_clientes_id.insert(1,_cli.numero_notificacion)

	# for f in onesignal_player_ids:

	# 	x = f in lista_clientes_id

	# 	if x ==False:

	# 		faltantes.insert(1,f)

	# #Enviando notificaciones faltantes:

	# print 'faltantes',faltantes

	# for _f in faltantes:

	# 	print 'faltantes..',_f

	# 	header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
	# 	payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [_f],"contents": {"en": "Bienvenida a My Look Xpress"},"data":{'codigo': _f}}
	# 	req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
	# 	print(req.status_code, req.reason)


	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")




@csrf_exempt
def asignanotificacionsocia(request):


	archivo = open("/home/backmylook/data.txt", 'r') 

	i=0
	for linea in archivo.readlines():
		i=i+1
		if int(i)==22:     
			t=linea


	player = json.loads(t)['players']

	onesignal_player_ids = []

	lista_clientes_id = []

	faltantes =[]

	for p in player:

		onesignal_player_ids.insert(1,p['id']) 

	for _cli in Socia.objects.all():

		lista_clientes_id.insert(1,_cli.numero_notificacion)

	for f in onesignal_player_ids:

		x = f in lista_clientes_id

		if x ==False:

			faltantes.insert(1,f)

	#Enviando notificaciones faltantes:

	print 'faltantes',faltantes

	for _f in faltantes:

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [_f],"contents": {"en": "Bienvenida a My Look Xpress"},"data":{'codigo': _f}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)


	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")



@csrf_exempt
def carganoti(request,perfil,id_cliente):


	archivo = open("/home/backmylook/data.txt", 'r') 

	i=0
	for linea in archivo.readlines():
		i=i+1
		if int(i)==22:     
			t=linea


	player = json.loads(t)['players']


	for p in player:

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [p['id']],"contents": {"en": "Bienvenida a My Look Xpress"},"data":{'codigo': p['id']}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)

	a= simplejson.dumps('OK')
		
	return HttpResponse(a, content_type="application/json")

class Uploadphoto(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def post(self, request):

		caption = request.FILES['file']

		#Guarda foto

		print caption

		id_user =request.user.id

		print id_user

		a = Agente.objects.get(user_id=id_user)

		a.photo = caption
		a.save()


		caption = '/home/capital_back/'+str(Agente.objects.get(user_id=id_user).photo)

		fd_img = open(caption, 'r')

		img = Image.open(fd_img)

		width, height = img.size

		img = resizeimage.resize_cover(img, [300, 300])

		img.save(caption, img.format)

		fd_img.close()

		a= simplejson.dumps('OK')
		
		return HttpResponse(a, content_type="application/json")


class Finalizaservicio(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def get(self, request,servicio):

		#

		# ser =Serviciopedido.objects.get(id=servicio)
		# ser.estrella =estrella
		# ser.save()

		#Enviando noti a cliente

		_ser = Serviciopedido.objects.get(id=servicio)
		_cliente = Cliente.objects.get(id=_ser.servicio.cliente.id)

		envianoti(_cliente.numero_notificacion,'Cuentanos como te fue el en servicio','finalizaservicio',_ser.id)

		a= simplejson.dumps('OK')
		
		return HttpResponse(a, content_type="application/json")


class Calificaservicio(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def get(self, request,servicio):

		#

		ser =Serviciopedido.objects.get(id=servicio)
		ser.estrella =estrella
		ser.save()

		#Enviando noti a cliente

		# _ser = Serviciopedido.objects.get(id=servicio)
		# _cliente = Cliente.objects.get(id_=_ser.cliente.id)

		# envianoti(_cliente.noti,'Cuentanos como te fue el en servicio','finalizaservicio',_ser.id)

		a= simplejson.dumps('OK')
		
		return HttpResponse(a, content_type="application/json")



class Actualizaperfil(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def post(self, request):

		nombre=None
		telefono=None
		email=None

		data = json.loads(request.body)['cliente']



		email=data['email']
		telefono=data['telefono']
		nombre=data['nombre']
		#codigo=data['codigo']



		id =request.user.id

		so=Cliente.objects.get(user_id=id)
		so.nombre = nombre
		so.email=email
		so.telefono=telefono
		#so.codigo_recibido=codigo
		so.save()

		#if Cliente.objects.filter(codigo_compartir=codigo).count()>0:

		#	clien = Cliente.objects.get(codigo_compartir=codigo)
		#	clien.estado_compartir_id=2
		#	clien.save()

		




		a= simplejson.dumps('OK')
		
		return HttpResponse(a, content_type="application/json")


class Enlinea(JSONWebTokenAuthMixin, View):

	#Retorna datos del agente
	def post(self, request):

		data = json.loads(request.body)['linea']


		print data

		_soc=Socia.objects.get(user_id=request.user.id)
		_soc.linea=data
		_soc.save()


		a= simplejson.dumps('OK')
		
		return HttpResponse(a, content_type="application/json")



def mobile(request):
	"""Return True if the request comes from a mobile device."""
	MOBILE_AGENT_RE=re.compile(r".*(iphone|mobile|androidtouch)",re.IGNORECASE)
	if MOBILE_AGENT_RE.match(request.META['HTTP_USER_AGENT']):
		return True
	else:
		return False

def ValuesQuerySetToDict(vqs):

	return [item for item in vqs]


## Agrega telefonos
def envianotificacion(request,tipo):

	if tipo=='Compartir':



		plantilla = Tiponotificacion.objects.get(nombre=tipo).plantilla
		
		c= simplejson.dumps(plantilla)

		print 'entre a compartir'

		return HttpResponse(c, content_type="application/json")

	else:


		return HttpResponse(simplejson.dumps('u'), content_type="application/json")


class Sacauser(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):

		id=request.user.id

		c=User.objects.filter(id=id).values('id','username','groups__name')
		
		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")


class Misfavoritos(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):

		id=request.user.id

		fav=Favoritos.objects.filter(cliente_id=Cliente.objects.get(user_id=id).id).values('id','sociacategoria__categoria_id','sociacategoria__socia_id','sociacategoria__socia__email','sociacategoria__socia__telefono','sociacategoria__socia__texperiencia','sociacategoria__descripcion','sociacategoria__titulo','sociacategoria__socia__photo','sociacategoria__socia__estrellas')

		for x in range(len(fav)):

			star=[]


			fav[x]['socia__photo']=fav[x]['sociacategoria__socia__photo']
			fav[x]['socia__descripcion']=fav[x]['sociacategoria__descripcion']
			fav[x]['socia__descripcion_titulo']=fav[x]['sociacategoria__titulo']
			fav[x]['socia__texperiencia']=fav[x]['sociacategoria__socia__texperiencia']
			fav[x]['socia__telefono']=fav[x]['sociacategoria__socia__telefono']
			fav[x]['socia__email']=fav[x]['sociacategoria__socia__email']
			fav[x]['socia__descripcion_socia']=fav[x]['sociacategoria__descripcion']
			

			_comentarios = Sociacomentario.objects.filter(socia_id=fav[x]['sociacategoria__socia_id']).values('comentario','cliente__nombre')

			fav[x]['comentario']=ValuesQuerySetToDict(_comentarios)

			__photos=Sociacategoriaphoto.objects.filter(socia_id=fav[x]['sociacategoria__socia_id'],categoria_id=fav[x]['sociacategoria__categoria_id']).values('socia__id','photo')

			fav[x]['photos']=ValuesQuerySetToDict(__photos)

			
			
			for st in range(5):


				if int(st)+1 <= int(fav[x]['sociacategoria__socia__estrellas']):

					star.append('*')

					print '*'
					
				else:

					star.append('-')

					print '-'



			fav[x]['estrellas']=star


		c= simplejson.dumps(ValuesQuerySetToDict(fav))

		return HttpResponse(c, content_type="application/json")



class Agregafavorito(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request,anuncio):

		id=request.user.id

		id_cliente = Cliente.objects.get(user_id=id).id

		Favoritos(sociacategoria_id=anuncio,cliente_id=id_cliente).save()


		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")


class Publica(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def post(self, request):

		id=request.user.id

		cli = Cliente.objects.get(user_id=id)

		#{u'data': {u'categoria': 1, u'telefono': u'3232', u'costo': u'323', u'subcategoria': [66], u'descripcion': u'323', u'titulo': u'2313', u'whatsapp': u'323', u'distrito': [559, 560], u'email': u'3232'}}

		data = json.loads(request.body)['data']

		if Socia.objects.filter(user_id=id).count()==0:

			_socia = Socia(photo=cli.photo,user_id=id,nombre=cli.nombre,telefono=cli.telefono,email=cli.email,estrellas=0).save()

			id_s = Socia.objects.all().values('id').order_by('-id')[0]['id']

			_socia = Socia.objects.get(id=id_s)

		else:

			_socia = Socia.objects.get(user_id=id)
		

		Sociacategoria(socia_id=_socia.id,categoria_id=data['categoria'],descripcion=data['descripcion'],titulo=data['titulo']).save()

		id_sc = Sociacategoria.objects.all().values('id').order_by('-id')[0]['id']
	
		_sociacategoria = Sociacategoria.objects.get(id=id_sc)

		for s in data['subcategoria']:

			print s,_socia.id

			Sociasubcategoria(sociacategoria_id=_sociacategoria.id,subcategoria_id=s,socia_id=_socia.id).save()

		for d in data['distrito']:

			Sociadistrito(socia_id=_socia.id,distrito_id=d).save()

		print 'Publica',json.loads(request.body)

		id_soccat = Sociacategoria.objects.all().values('id').order_by('-id')[0]['id']


		c= simplejson.dumps(id_soccat)

		return HttpResponse(c, content_type="application/json")



class Guardadatosmovil(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def post(self, request):


		id=request.user.id

		modelo_celular = json.loads(request.body)['model']
		version_celular = json.loads(request.body)['tipo']

		if Cliente.objects.filter(user_id=id):

			so = Cliente.objects.get(user_id=id)
			so.modelo_celular = modelo_celular
			so.version_celular = version_celular
			so.save()


		if Socia.objects.filter(user_id=id):

			so = Socia.objects.get(user_id=id)
			so.modelo_celular = modelo_celular
			so.version_celular = version_celular
			so.save()


		##Guadando  Numero de Notificacion del  movil

		os.system('/bin/sh /home/backmylook/devices.sh')

		archivo = open("/home/backmylook/data.txt", 'r') 

		i=0

		for linea in archivo.readlines():
			i=i+1

			if len(linea)>1000:     

				t=linea

		player = json.loads(t)['players']

		##Lista modelos

		for p in player:

			modelo = p['device_model']

			version = p['device_os']

			cl = Cliente.objects.filter(modelo_celular=modelo,version_celular=version)

			if cl.count()>0:



				for s in cl:

					#print modelo,version,p['id'],p['invalid_identifier']

					if p['invalid_identifier']==False:


						s.numero_notificacion = p['id']
						s.save()

			soc = Socia.objects.filter(modelo_celular=modelo,version_celular=version)

			if soc.count()>0:

				

				for s in soc:

					s.numero_notificacion = p['id']
					s.save()



		c= simplejson.dumps({'u':'ok'})

		return HttpResponse(c, content_type="application/json")



class Sacasocia(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):

		id=request.user.id

		c=Socia.objects.filter(user_id=id).values('id','nombre','apellido','photo','user__groups__name','correo','telefono','direccion','distrito__nombre')
		
		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")

class Promopago(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request,promo,id_servicio):

		id=request.user.id

		id_user_a_compartir = None

		numero_notificacion=None

		print promo,id_servicio

		id_cliente=Cliente.objects.get(user_id=id).id

		_promo =Promocodigo.objects.filter(codigo=promo,estado_compartir__nombre='Pendiente')


		if _promo.count()>0 and (id_user_a_compartir!=id):

			print 'Entre.....................',_promo,_promo.count()

			if _promo[0].cliente:

				id_user_a_compartir=_promo[0].cliente.user.id

			id_promo = _promo[0].id
			descuento = _promo[0].descuento
			
			if _promo[0].cliente: 

				numero_notificacion = _promo[0].cliente.numero_notificacion

				email=str(_promo[0].cliente.email)

				codigo_compartir = id_generator(8,string.ascii_lowercase)


				datax = 'Ganaste 5 soles de descuento en tu proximo pedido en My Look Xpress al ingresar el codigo de promocion '+codigo_compartir

				header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
				payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": datax},"data":{'aceptaservicio': 'ok'}}
				req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
				
				enviacorreo('Ganaste 5 soles',datax,email)

				Promocodigo(cliente_id=id_cliente,codigo=codigo_compartir,descuento=5,nombre='Promocion Gana 5 soles descuento por compartir la app').save()

			else:

				numero_notificacion = Cliente.objects.get(user_id=id).numero_notificacion
				email=Cliente.objects.get(user_id=id).email

			
			pr = Promocodigo.objects.get(id=id_promo)
			pr.cliente_compartido_id=id_cliente
			pr.fecha_compartir=datetime.datetime.today()
			pr.estado_compartir_id=3
			pr.save()


			_ser =Servicio.objects.get(id=id_servicio)
			_ser.precio_promo = _ser.precio-descuento
			_ser.save()

			codigo_compartir = id_generator(8,string.ascii_lowercase)
			cl=Cliente.objects.get(id=id_cliente)
			cl.codigo_compartir=codigo_compartir
			cl.save()


			
			#_promo[0].cliente


			# Enviar el regalo de de 5 soles de descuento con el codigo


			



			c= simplejson.dumps('Felicitaciones, se hizo efectivo el precio promocional')

			return HttpResponse(c, content_type="application/json")



		else:

			c= simplejson.dumps('Codigo no valido o expirado')

			return HttpResponse(c, content_type="application/json")






class Miperfil(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):


		grupos = Group.objects.get(user=request.user.id).name

		print 'gupo.....',grupos

		if grupos=='Socia':

			c=Socia.objects.filter(user_id=request.user.id).values('linea','id','nombre','apellido','photo','user__groups__name','telefono','direccion','distrito__nombre','user__first_name','email')
		

		if grupos=='Cliente':

			c=Cliente.objects.filter(user_id=request.user.id).values('photo','codigo_recibido','codigo_compartir','id','nombre','apellido','photo','photo_facebook','user__groups__name','email','telefono','direccion','distrito__nombre','user__first_name')
		
		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")




class Asignasocia(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def post(self, request):

		print json.loads(request.body)

		cat = json.loads(request.body)['categoria']

		soc = json.loads(request.body)['socia']

		detalle = json.loads(request.body)['detalle']

		user_id=request.user.id
			
		so = Socia.objects.get(user_id=user_id)

		if cat:

			for c in cat:

				print c

				if c['check']==True:

					Sociasubcategoria(socia_id=so.id,subcategoria_id=c['id']).save()

		if detalle:

			experiencia=detalle['experiencia']
			referencia=detalle['referencia']
			comentario=detalle['comentario']

			so.experiencia=experiencia
			so.referencia=referencia
			so.comentario=comentario
			so.save()

		c= simplejson.dumps(ValuesQuerySetToDict('c'))

		return HttpResponse(c, content_type="application/json")




class Mianuncios(JSONWebTokenAuthMixin, View):

	## Agrega telefonos

	def get(self, request):

		_socia = Socia.objects.get(user_id=request.user.id)

		_anuncios = Sociacategoria.objects.filter(socia_id=_socia.id)
		
		serializer= MianunciosSerializer(_anuncios,many=True)

		return JsonResponse(serializer.data, safe=False)


class Miservicios(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):

		id_cliente=Cliente.objects.get(user_id=request.user.id).id

		c= Servicio.objects.filter(cliente_id=id_cliente,eliminado=0).values('id','cliente__nombre','dia__nombre','cliente__photo','socia__photo','socia__nombre','socia__nombre','cliente__photo_facebook').order_by('-id')

		fmt = '%H:%M'

		fmt1= '%b-%d'

		for i in range(len(c)):

			c[i]['fecha_inicio']= Servicio.objects.get(id=c[i]['id']).fecha_inicio.strftime(fmt)

			c[i]['fecha']= Servicio.objects.get(id=c[i]['id']).fecha.strftime(fmt1)

			sp=Serviciopedido.objects.filter(servicio_id=c[i]['id']).values('subcategoria__nombre','subcategoria__precio')

			c[i]['pedidos'] =ValuesQuerySetToDict(sp)

			if c[i]['socia__photo']=='':

				c[i]['socia__photo']='https://pbs.twimg.com/profile_images/378800000088275981/f2ed689173e3efda08058844acadf393.jpeg'

			else:

				c[i]['socia__photo']='https://mylookxpressapp.com:2500/'+c[i]['socia__photo']




		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")

class Miserviciossocias(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self,request,socia):

		id_socia=Socia.objects.get(user_id=request.user.id).id

		#Serviciopedido.objects.filter(socia_id=id_socia).values('servicio__cliente__photo_facebook','servicio__cliente__nombre','servicio__cliente__nombre')

		c= Serviciopedido.objects.filter(socia_id=id_socia).values('id','servicio__cliente__photo_facebook','servicio_id','servicio__cliente__nombre','servicio__dia__nombre','servicio__cliente__photo','servicio__socia__photo','servicio__socia__nombre','servicio__socia__nombre','servicio__cliente__photo').order_by('-servicio_id')

		fmt = '%H:%M'

		fmt1= '%b-%d'

		for i in range(len(c)):

			id_servicio_pedido= c[i]['id']

			c[i]['id']=id_servicio_pedido
			c[i]['cliente__nombre']=Serviciopedido.objects.get(id=id_servicio_pedido).servicio.cliente.nombre
			#c[i]['dia__nombre']=Serviciopedido.objects.get(id=id_servicio_pedido).servicio.dia.nombre

			c[i]['cliente__photo_facebook']=str(Serviciopedido.objects.get(id=id_servicio_pedido).servicio.cliente.photo_facebook)

			print c[i]['cliente__photo_facebook']
			

			c[i]['fecha_inicio']= Serviciopedido.objects.get(id=id_servicio_pedido).servicio.fecha_inicio.strftime(fmt)

			c[i]['fecha']= Serviciopedido.objects.get(id=id_servicio_pedido).servicio.fecha.strftime(fmt1)

			sp=Serviciopedido.objects.filter(id=id_servicio_pedido).values('subcategoria__nombre','subcategoria__precio')

			c[i]['pedidos'] =ValuesQuerySetToDict(sp)


		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")


# class Detalleservicio(JSONWebTokenAuthMixin, View):

	
# 	## Agrega telefonos
# 	def get(self, request,servicio):

# 		c= Servicio.objects.filter(id=servicio).values('id','cliente__nombre','dia__nombre','cliente__photo','socia__photo','socia__nombre','socia__nombre','latitud','longitud','estado__nombre','referencia').order_by('-id')

# 		fmt = '%H:%M'

# 		fmt1= '%b-%d'

# 		for i in range(len(c)):

# 			print 'c[i][id]',c[i]['id']

# 			c[i]['fecha_inicio']= Servicio.objects.get(id=c[i]['id']).fecha_inicio.strftime(fmt)

# 			c[i]['fecha']= Servicio.objects.get(id=c[i]['id']).fecha.strftime(fmt1)

# 			sp=Serviciopedido.objects.filter(servicio_id=c[i]['id']).values('subcategoria__nombre','subcategoria__precio')

# 			c[i]['pedidos'] =ValuesQuerySetToDict(sp)


# 		c= simplejson.dumps(ValuesQuerySetToDict(c))

# 		return HttpResponse(c, content_type="application/json")



class Ultimoservicio(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def get(self, request):

		socia_id=Socia.objects.get(user_id=request.user.id)

		id_serv = Servicio.objects.all().values('id').order_by('-id')[0]['id']

		c= Servicio.objects.filter(id=id_serv,socia_id=socia_id).values('id','cliente__nombre','dia__nombre','cliente__photo','socia__photo','socia__nombre','socia__nombre','latitud','longitud').order_by('-id')

		fmt = '%H:%M'

		fmt1= '%b-%d'

		for i in range(len(c)):

			c[i]['fecha_inicio']= Servicio.objects.get(id=c[i]['id']).fecha_inicio.strftime(fmt)

			c[i]['fecha']= Servicio.objects.get(id=c[i]['id']).fecha.strftime(fmt1)

			sp=Serviciopedido.objects.filter(servicio_id=c[i]['id']).values('subcategoria__nombre','subcategoria__precio','subcategoria__categoria__icono')

			c[i]['pedidos'] =ValuesQuerySetToDict(sp)


		c= simplejson.dumps(ValuesQuerySetToDict(c))

		return HttpResponse(c, content_type="application/json")


class Creatoken(JSONWebTokenAuthMixin, View):

	
	## Agrega telefonos
	def post(self, request):


		culqipy.public_key = 'pk_test_89yrgEwJ9M3AC5mE'

		culqipy.secret_key = 'sk_test_pOJqNgFLeq0BP8zX'

		print 'culpi...',culqipy

		token = culqipy.Token.create(
				card_number="4111111111111111",
				currency_code="PEN",
				cvv="123",
				exp_month=9,
				exp_year=2020,
				fingerprint="q352454534",
				last_name="Muro",
				email="wmuro@me.com",
				first_name="William")

		print(token["id"])


		c= simplejson.dumps(ValuesQuerySetToDict('c'))

		return HttpResponse(c, content_type="application/json")


def haversine(lat1, lon1, lat2, lon2):

	rad=math.pi/180
	dlat=lat2-lat1
	dlon=lon2-lon1
	R=6372.795477598
	a=(math.sin(rad*dlat/2))**2 + math.cos(rad*lat1)*math.cos(rad*lat2)*(math.sin(rad*dlon/2))**2
	distancia=2*R*math.asin(math.sqrt(a))
	return distancia


class Listasocias(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def post(self,request):

		data = json.loads(request.body)

		print 'data.....',data

		pedidos =[]

		for p in data:

			pedidos.append(p['id'])

		query = reduce(operator.and_, (Q(subcategoria__id__contains = item) for item in pedidos))

		_socia=Sociasubcategoria.objects.filter(query).values('socia__nombre','subcategoria__nombre','socia__texperiencia','comentario','referencia','socia__photo','socia__descripcion_titulo','socia__descripcion_socia')

		_socia = ValuesQuerySetToDict(_socia)

		return HttpResponse(simplejson.dumps(_socia), content_type="application/json")



class Buscasocia(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def post(self,request,id_socia):

		print 'Buscando socias....'

		data = json.loads(request.body)

		tipo=None
		datolugar=None

		for t in data:

			if t =='tipo':

				tipo= data['tipo']

			if t=='datolugar':

				datolugar=data['datolugar']

		print data

		latitud=None

		longitud=None

		pedidos =[]

		for p in data['pedido']:

			pedidos.append(p['id'])



		#print 'Pedidos..',pedidos

		if data['ubicacion']:

			for d in data['ubicacion']:

				if d=='lat':

					latitud = data['ubicacion']['lat']

					longitud = data['ubicacion']['long']


		reservado = str(data['hora'])

		data['referencia'] = data['referencia'].encode('ascii','ignore')

		data['referencia'] = data['referencia'].encode('ascii','replace')

		referencia = str(data['referencia'])

		reservado = datetime.datetime.strptime(reservado, '%H:%M')

		reservado= str(reservado.strftime('%H:%M:%S'))

		dia = data['dia']

		xx=datetime.datetime.strptime(str(data['dia'])[0:10], '%Y-%m-%d')

		#ubicacion = data['reserva']['ubicacion']

		dia=dia[0:10]

		hora = reservado[0:2]

		minuto = reservado[3:5]

		segundo = reservado[6:8]

		hora_reserva =  hora+':'+minuto+'[:'+segundo+'[.000000]]'

		print 'hora_reserva',hora_reserva

		fecha=  datetime.datetime.strptime(str(dia), '%Y-%m-%d')

		dia = fecha.strftime("%a")

		print 'dia',dia

		if dia=='Sun': dia='Domingo'
		if dia=='Mon': dia='Lunes'
		if dia=='Tue': dia='Martes'
		if dia=='Wed': dia='Miercoles'
		if dia=='Thu': dia='Jueves'
		if dia=='Fri': dia='Viernes'
		if dia=='Sat': dia='Sabado'


		if dia=='Sabado':ndia=6
		if dia=='Viernes':ndia=5
		if dia=='Jueves':ndia=4
		if dia=='Miercoles':ndia=3
		if dia=='Martes':ndia=2
		if dia=='Lunes':ndia=1
		if dia=='Domingo':ndia=7

		cli = Cliente.objects.get(user_id=request.user.id).id

		query = reduce(operator.and_, (Q(subcategoria__id__contains = item) for item in pedidos))
		
		#{u'pedido': [{u'descripcion': u'ghghg<br> Costo: S/. 2.0', u'nombre': u'Manicure Express', u'precio': 2, u'id': 1, u'check': True}, {u'descripcion': u'<br> Costo: S/. 2.0', u'nombre': u'Manicure Spa', u'precio': 2, u'id': 2, u'check': True}]}

		sociascate=Sociasubcategoria.objects.filter(query)

		print 'Nuemros de Socias..',sociascate.count()



		Servicio(dato_lugar=datolugar,tipo_vivienda=tipo,socia_id=1,referencia=referencia,dia_id=ndia,fecha_inicio=hora_reserva,cliente_id=cli,fecha=xx,latitud=latitud,longitud=longitud,estado_id=1).save()

		id_serv = Servicio.objects.all().values('id').order_by('-id')[0]['id']

		Serviciosintentos(servicio_id=id_serv,socia_id=1,fecha=datetime.datetime.today()).save()

		id_servint = Serviciosintentos.objects.all().values('id').order_by('-id')[0]['id']

		x = Serviciosintentos.objects.get(id=id_servint)
		x.detalle='El cliente creo un nuevo servicio'
		x.save()




		_socia = Serviciosintentos.objects.filter(id=id_servint).values('servicio_id','servicio__socia__nombre','servicio__socia__photo','servicio__socia__telefono','servicio__socia__descripcion_titulo','servicio__socia__descripcion_socia')

		for i in range(len(_socia)):

			if _socia[i]['servicio__socia__photo']=='':

				_socia[i]['servicio__socia__photo']='https://pbs.twimg.com/profile_images/378800000088275981/f2ed689173e3efda08058844acadf393.jpeg'

			else:

				_socia[i]['servicio__socia__photo']='https://mylookxpressapp.com:2500/'+_socia[i]['servicio__socia__photo']


		_socia = ValuesQuerySetToDict(_socia)


		## Enviando token

		redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

		message = RedisMessage('pendiente')

		# and somewhere else
		
		redis_publisher.publish_message(message)





		# if sociascate.count()==0:

		# 	print '7'

		# 	_socia ='No se encontro'

			# subject, from_email, to = 'My Look Express', 'info@mylookxpress.com', 'rossestrella031@gmail.com'
			
			# text_content = 'Una cliente nueva no encontro una socia, porfavor apoyarle, en el siguiente link detalle su informacion: '

			# text_content= text_content+'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_serv)
			
			# msg = EmailMultiAlternatives(subject, text_content, from_email, [to])

			# msg.send()


		contador = 0

		##Guarda pedidos subcategorias

		precio_total=0

		for p in data['pedido']:


			print 'pedido......',p

			cantidad=1

			if p=='cantidad':

				if p['cantidad']['cantidad']=='':

					cantidad=1

				else:

					cantidad=int(p['cantidad']['cantidad'])



			if p['descuento']==None:

					p['descuento']=0


			print 'precio....',p['precio'],'descuento...',p['descuento']

			#if p=='precio_descuento':

			precio_con_descuento = p['precio_descuento']

			# else:

			# 	precio_con_descuento=0


			precio_total = precio_total + precio_con_descuento

			print 'cantidad',cantidad

			print  'escogido', p['escogido']


			Serviciopedido(socia_id=p['escogido']['socia__id'],cantidad=cantidad,servicio_id=id_serv,subcategoria_id=p['id'],precio=p['precio'],descuento=p['descuento'],precio_con_descuento=precio_con_descuento).save()


		_servi = Servicio.objects.get(id=id_serv)
		_servi.precio = precio_total
		_servi.save()


		# for s in sociascate:


		
		# 	t = Turnosocia.objects.filter(socia_id=s.socia.id,fecha_inicio__lte=hora_reserva,fecha_fin__gte=hora_reserva,dia__nombre=dia)

		# 	### Envia notificacion a la socia

		# 	if t.count()>0:

		# 		contador=contador+1

		# 		#print 'Socia encontrada..',s.socia.nombre,s.socia.numero_notificacion

		# 		if s.socia.numero_notificacion:

		# 			ser = Servicio.objects.get(id=id_serv)
		# 			ser.socia_id=s.socia.id
		# 			ser.save()

		# 			Serviciopedido.objects.filter(servicio_id=id_serv).update(socia_id=s.socia.id)
						

		# 			id_servint = Serviciosintentos.objects.all().values('id').order_by('-id')[0]['id']

		# 			x = Serviciosintentos.objects.get(id=id_servint)
		# 			x.socia_id = s.socia.id
		# 			x.detalle='Se encontro una socia'


		# 			x.save()

		# 			_socia = Serviciosintentos.objects.filter(id=id_servint).values('servicio__socia__descripcion_socia','servicio__socia__descripcion_titulo','servicio_id','servicio__socia__nombre','servicio__socia__photo','servicio__socia__telefono','servicio__socia__texperiencia')

		# 			for i in range(len(_socia)):

		# 				if _socia[i]['servicio__socia__photo']=='':

		# 		 			_socia[i]['servicio__socia__photo']='https://pbs.twimg.com/profile_images/378800000088275981/f2ed689173e3efda08058844acadf393.jpeg'

		# 		 		else:

		# 		 			_socia[i]['servicio__socia__photo']='https://mylookxpressapp.com:2500/'+_socia[i]['servicio__socia__photo']

		# 			_socia = ValuesQuerySetToDict(_socia)

		# 			break

		
		if int(contador)==0:

			x = Serviciosintentos.objects.get(id=id_servint)
			x.detalle='No se encontro socia'

			x.save()

			#_socia = 'No se encontro'

		
			# subject, from_email, to = 'My Look Xpress', 'info@mylookxpress.com', 'rossestrella031@gmail.com'

			# text_content = 'Existen socias para este pedido pero no esta disponibles en este horario porfavor solucionar: '

			# text_content= text_content+'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_serv)

			# msg = EmailMultiAlternatives(subject, text_content, from_email, [to])

			# msg.send()

		print 'Socia Enc..',_socia

		return HttpResponse(simplejson.dumps(_socia), content_type="application/json")


def categoria(request,sexo):



	c= Categoria.objects.filter(visible=True).values('id','nombre','photo','photo_home','icono','icono_seleccionado','sexo__nombre').order_by('orden')

	for i in range(len(c)):

		c[i]['check']=True




	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")




@csrf_exempt
def enviatelefono(request):


	if request.method=='POST':

		soc = json.loads(request.body)

		print soc

		c= simplejson.dumps('uu')

	return HttpResponse(c, content_type="application/json")




@csrf_exempt
def nuevasocia(request):

	print 'entrando..'

	if request.method=='POST':

		#print json.loads(request.body)







		#cat = json.loads(request.body)['categoria']

		soc = json.loads(request.body)['socia']

		#detalle = json.loads(request.body)['detalle']

		if soc:

			#referencia = soc['referencia']
			comentario=soc['comentario']
			#apellido=soc['apellido']
			distrito=soc['distrito']['id']
			#ncuenta=soc['cuenta']
			#direccion=soc['direccion']
			#horario=soc['horario']
			#experiencia=soc['experiencia']
			nombre=soc['nombre']
			telefono=soc['telefono']
			email=soc['email']



			if User.objects.filter(username=email).count()>0:

				c= simplejson.dumps(0)

				return HttpResponse(c, content_type="application/json")


			User.objects.create_user(email, email, 'rosa0000')

			id_user = User.objects.all().values('id').order_by('-id')[0]['id']

			u = User.objects.get(id=id_user)

			# u.first_name= json.loads(request.body)['nombre']

			# u.save()

			usuario = authenticate(username=email, password='rosa0000')

			login(request, usuario)

			group = Group.objects.get(name='Socia')

			u.groups.add(group)

			codigo_compartir = id_generator(8,string.ascii_lowercase)

			if Socia.objects.filter(codigo_compartir=codigo_compartir).count()>0:

				codigo_compartir = id_generator(8,string.ascii_lowercase)

			Socia(user_id=id_user,email=email,nombre=nombre,telefono=telefono,distrito_id=distrito,comentario=comentario,fecha_inscripcion=datetime.datetime.now(),estado_compartir_id=1,codigo_compartir=codigo_compartir).save()

			id_socia = Socia.objects.all().values('id').order_by('-id')[0]['id']

			#codigo_compartir=soc['codigo_compartir']

			#socia_compartir= Socia.objects.filter(codigo_compartir=codigo_compartir,estado_compartir_id=1)

			#if socia_compartir.count()>0:

			#	sc=socia_compartir[0]
			#	sc.estado_compartir_id
			#	Compartir(socia_id=id_socia,socia_compartir_id=sc[0].id,fecha_compartir=datetime.datetime.today(),codigo_compartir=codig)


			#Turno Manana

			for i in [1,2,3,4,5,6,7]:

				Turnosocia(socia_id=id_socia,dia_id=i,fecha_inicio='06:00:00',fecha_fin='12:00:00').save()

			#Turno Tarde

			for i in [1,2,3,4,5,6,7]:

				Turnosocia(socia_id=id_socia,dia_id=i,fecha_inicio='12:00:00',fecha_fin='21:00:00').save()


			##Guardando subctaegorias de la socia

			for p in json.loads(request.body)['pedido']:

				_cat = p['id']

				subcat = Subcategoria.objects.filter(categoria_id=_cat)

				for c in subcat:

					Sociasubcategoria(socia_id=id_socia,subcategoria_id=c.id).save()




			subject, from_email, to = 'My Look Xpress Nueva Socia', 'info@mylookxpress.com', 'rossestrella031@gmail.com'
			
			text_content = 'Un nueva socia '
			
			html_content = ''

			# for c in cat:

			# 	html_content = html_content + ' <br> '+c['nombre']

			# categoriastxt = html_content

			titulo = 'Estimad Rosangela se solicito una nueva socia con los siguientes datos :<br><br> '


			nombre = 'Nombre: '+soc['nombre']+ ' <br>'
			#apellido = 'Nombre: '+soc['nombre']+ ' <br>'
			telefono = 'Telefono '+soc['telefono']+ ' <br>'
			email ='Email '+soc['email']+'<br>'
			#direccion='Direccion '+soc['direccion']+' <br>'
			#experiencia='Experiencia '+soc['experiencia']+' <br>'
			#horario='Horario '+soc['horario']+' <br>'
			#referencia='Referencia '+soc['referencia']+' <br>'
			comentario='Comentario '+soc['comentario']+' <br>'
			#ncuenta='Numero de Cuenta '+soc['cuenta']+' <br>'
			#direccion='Direccion '+soc['direccion']+' <br>'
			detalle ='<br> Para mas detalle, ingresar a http://estokealo.com:8000/admin/app/socia/'+str(id_socia)+'/change/'

			html_content= titulo +nombre+email+comentario+detalle

			msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
			#msg.attach_file('/var/www/hermes/out.pdf')
			msg.attach_alternative(html_content, "text/html")

			msg.send()


			# emailsocia = 'Hola Pepita, te invitamos a continuar con el proceso de seleccion, pasando una entrevista con nosotros; trayendo tu CV y adjuntando lo sgte: tus antecedentes policiales, penales y judiciales; el dia 15 de Abril a 8:00 am. En Av. Campodonico 547 Santa Catalina. Cualquier consulta: 990995742'
			
			# msg1 = EmailMultiAlternatives(subject, text_content, from_email, [soc['email']])
			# #msg.attach_file('/var/www/hermes/out.pdf')
			# msg1.attach_alternative(emailsocia, "text/html")

			# msg1.send()
			


			#Agrega el ID Device

			# archivo = open("/home/backmylook/data.txt", 'r') 

			# i=0
			# for linea in archivo.readlines():
			# 	i=i+1
			# 	if int(i)==22:     
			# 		t=linea


			# player = json.loads(t)['players']

			# onesignal_player_ids = []

			# lista_clientes_id = []

			# faltantes =[]

			# for p in player:

			# 	onesignal_player_ids.insert(1,p['id']) 

			# for _cli in Socia.objects.all():

			# 	lista_clientes_id.insert(1,_cli.numero_notificacion)

			# for f in onesignal_player_ids:

			# 	x = f in lista_clientes_id

			# 	if x ==False:

			# 		faltantes.insert(1,f)

			#Enviando notificaciones faltantes:

			

			# for _f in faltantes:

			# 	header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
			# 	payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [_f],"contents": {"en": "Bienvenida a My Look Xpress"},"data":{'codigo': _f}}
			# 	req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
			# 	print(req.status_code, req.reason)



		# if cat:

		# 	user_id=request.user.id
			
		# 	so = Socia.objects.get(user_id=user_id)

		# 	for c in cat:

		# 		print c

		# 		if c['check']==True:

		# 			Sociasubcategoria(socia_id=so.id,subcategoria_id=c['id']).save()

		# if detalle:

		# 	user_id=request.user.id
			
		# 	so = Socia.objects.get(user_id=user_id)


		# 	experiencia=detalle['experiencia']
		# 	referencia=detalle['referencia']
		# 	comentario=detalle['comentario']

		# 	so.experiencia=experiencia
		# 	so.referencia=referencia
		# 	so.comentario=comentario
		# 	so.save()




	c= simplejson.dumps(soc['email'])

	return HttpResponse(c, content_type="application/json")



class Detallecategoria(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_categoria):

		_sc=Sociasubcategoria.objects.filter(socia_id=Socia.objects.get(user=request.user).id,subcategoria__categoria_id=id_categoria)

		serializer= MianunciosSerializer(_sc,many=True)

		return JsonResponse(serializer.data, safe=False)
		


class Detalleservicio(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):

		print 'request..............',request.user.id

		grupo = User.objects.get(pk=request.user.id).groups.get()

		print 'grupo...../////',grupo

		if str(grupo)=='Socia':

			c= Serviciopedido.objects.filter(id=id_servicio).values('id')

			fmt = '%H:%M:%S'

			fmt1= '%Y-%m-%d'

			for i in range(len(c)):

				id_servicio=c[i]['id']

				c[i]['socia_id']=Serviciopedido.objects.get(id=id_servicio).socia.id
				c[i]['referencia']=Serviciopedido.objects.get(id=id_servicio).servicio.referencia
				c[i]['id']=Serviciopedido.objects.get(id=id_servicio).servicio.id
				c[i]['cliente__nombre']=Serviciopedido.objects.get(id=id_servicio).servicio.cliente.nombre
				#c[i]['dia__nombre']=Serviciopedido.objects.get(id=id_servicio).servicio.dia.nombre
				c[i]['cliente__photo']=str(Serviciopedido.objects.get(id=id_servicio).servicio.cliente.photo)
				c[i]['latitud']=Serviciopedido.objects.get(id=id_servicio).servicio.latitud
				c[i]['longitud']=Serviciopedido.objects.get(id=id_servicio).servicio.longitud
				c[i]['estado__nombre']=Serviciopedido.objects.get(id=id_servicio).servicio.estado.nombre
				c[i]['cliente__photo_facebook']=Serviciopedido.objects.get(id=id_servicio).servicio.cliente.photo_facebook
				c[i]['fecha_inicio']= Serviciopedido.objects.get(id=id_servicio).servicio.fecha_inicio.strftime(fmt)

				c[i]['fecha']= Serviciopedido.objects.get(id=id_servicio).servicio.fecha.strftime(fmt1)

				sp=Serviciopedido.objects.filter(id=id_servicio).values('cantidad','id','precio','precio_con_descuento','subcategoria__nombre','subcategoria__precio','subcategoria__categoria__icono')

				c[i]['pedidos'] =ValuesQuerySetToDict(sp)



			c= simplejson.dumps(ValuesQuerySetToDict(c))

			return HttpResponse(c, content_type="application/json")


		else:

			c= Servicio.objects.filter(id=id_servicio).values('precio_promo','socia_id','referencia','id','cliente__nombre','dia__nombre','cliente__photo','socia__photo','socia__nombre','latitud','longitud','estado__nombre','cliente__photo_facebook','socia__photo')

			fmt = '%H:%M:%S'

			fmt1= '%Y-%m-%d'

			for i in range(len(c)):

				print 'socia_photo...',c[i]['socia__photo']

				if c[i]['socia__photo'] == '':

					c[i]['socia__photo']='https://pbs.twimg.com/profile_images/378800000088275981/f2ed689173e3efda08058844acadf393.jpeg'

				else:

					c[i]['socia__photo']='https://mylookxpressapp.com:2500/'+c[i]['socia__photo']

				c[i]['fecha_inicio']= Servicio.objects.get(id=c[i]['id']).fecha_inicio.strftime(fmt)

				c[i]['fecha']= Servicio.objects.get(id=c[i]['id']).fecha.strftime(fmt1)

				sp=Serviciopedido.objects.filter(servicio_id=c[i]['id']).values('precio','precio_con_descuento','socia__nombre','socia__photo','subcategoria__nombre','subcategoria__precio','subcategoria__categoria__icono')

				c[i]['pedidos'] =ValuesQuerySetToDict(sp)


			c= simplejson.dumps(ValuesQuerySetToDict(c))

			return HttpResponse(c, content_type="application/json")



class Aceptarservicio(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def post(self,request):


		print 'aceptaser',json.loads(request.body)[0]['id']

		id_socia=Socia.objects.get(user_id=request.user.id).id



		ser = Servicio.objects.get(id=json.loads(request.body)[0]['id'])

		numero_notificacion  = Cliente.objects.get(user_id=ser.cliente.user.id).numero_notificacion

		noticliente = ser.cliente.numero_notificacion

		ser.socia_id = id_socia

		ser.estado_id=2

		ser.save()

		print 'Enviando notificacion a cliente',numero_notificacion,Cliente.objects.get(user_id=ser.cliente.user.id).email

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "La chica que te atendera esta por venir"},"data":{'aceptaservicio': json.loads(request.body)[0]['id']}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)

		x = {'servicio':json.loads(request.body)[0]['id'],'detalle':'socia-cliente'}

		c= simplejson.dumps(x)

		return HttpResponse(c, content_type="application/json")





class Cancelaserviciocliente(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):


		ser = Servicio.objects.get(id=id_servicio)

		numero_notificacion  = Socia.objects.get(user_id=ser.socia.user.id).numero_notificacion

		ser.estado_id=4

		ser.save()

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "La cliente cancelo  el servicio"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)

		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")

class Cancelaserviciosocia(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def post(self,request):

		id_servicio = json.loads(request.body)[0]['id']


		ser = Servicio.objects.get(id=id_servicio)

		numero_notificacion  = Cliente.objects.get(user_id=ser.cliente.user.id).numero_notificacion

		ser.estado_id=6

		ser.save()

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "La socia cancelo  el servicio, estamos buscando otra socia para ti en breves momentos"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		print(req.status_code, req.reason)

		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")



def envianoti(numero_notificacion,contenido,clave,valor):

	header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
	payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": contenido},"data":{clave: valor}}
	req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))

	return req

class Pagarenefectivo(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):

		ser = Servicio.objects.get(id=id_servicio)

		link = 'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_servicio)

		numero_notificacion  = Socia.objects.get(user_id=ser.socia.user.id).numero_notificacion

		ser.estado_id=8

		ser.save()

		#Enviando socket

		redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

		message = RedisMessage('confirmado')

		# and somewhere else
		
		redis_publisher.publish_message(message)

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "Tienes un nuevo servicio, ir a atenderla"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		
		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")



class Pagotulki(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):

		ser = Servicio.objects.get(id=id_servicio)

		link = 'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_servicio)

		numero_notificacion  = Socia.objects.get(user_id=ser.socia.user.id).numero_notificacion

		ser.estado_id=9

		ser.save()

		#Enviando socket

		redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

		message = RedisMessage('confirmado')

		# and somewhere else
		
		redis_publisher.publish_message(message)

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "Tienes un nuevo servicio, ir a atenderla"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		
		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")


class Pagoyape(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):

		ser = Servicio.objects.get(id=id_servicio)

		link = 'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_servicio)

		numero_notificacion  = Socia.objects.get(user_id=ser.socia.user.id).numero_notificacion

		ser.estado_id=10

		ser.save()

		#Enviando socket

		redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

		message = RedisMessage('confirmado')

		# and somewhere else
		
		redis_publisher.publish_message(message)

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "Tienes un nuevo servicio, ir a atenderla"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		
		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")




class Aceptarserviciocliente(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def get(self,request,id_servicio):


		ser = Servicio.objects.get(id=id_servicio)


		link = 'http://estokealo.com:8000/admin/app/serviciopedido/?servicio__id__exact='+str(id_servicio)

		numero_notificacion  = Socia.objects.get(user_id=ser.socia.user.id).numero_notificacion

		ser.estado_id=3

		ser.save()

		#Wnviando a Slack

		headers = {'Content-type': 'application/json', 'Authorization':'Bearer xoxp-309631093607-308556222404-386286118593-0c98721f09799cec9642c2924e961f49'}

		phone_number= Cliente.objects.get(user_id=request.user.id).telefono

		if phone_number:

			if phone_number[:2] != '51' and len(phone_number)==9:

				phone_number = '51%s' % phone_number

		_datos = {"channel":"mylook","attachments": [{

				"author_name": Cliente.objects.get(user_id=request.user.id).nombre,
            	"author_link": link,
				"color": "#345678",
				"pretext": "Confirmacion de Servicio",
				"title": "Whatsapp",
				"title_link": 'https://wa.me/'+str(phone_number),
				"footer": "My Look Xpress",
				"footer_icon": "https://lh3.googleusercontent.com/i7F_CVDccNVkUCP04bfWtBaea3a-ptwfv6Bj4X0WxVD9UyMz4cdZeJ9MV-o87-1zF9c=s180"

			}
		]}

		url= 'https://slack.com/api/chat.postMessage'

		r = requests.post(url, data=json.dumps(_datos), headers=headers)

		#Enviando socket


		redis_publisher = RedisPublisher(facility='foobar', broadcast=True)

		message = RedisMessage('confirmado')

		# and somewhere else
		
		redis_publisher.publish_message(message)

		header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic OGQyNTllMmUtMmY2Ny00ZGQxLWEzNWMtMjM5NTdlNjM0ZTc3"}
		payload = {"app_id": "6d06ccb5-60c3-4a76-83d5-9363fbf6b40a","include_player_ids": [numero_notificacion],"contents": {"en": "Tienes un nuevo servicio, ir a atenderla"},"data":{'aceptaservicio': id_servicio}}
		req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
		
		c= simplejson.dumps(id_servicio)

		return HttpResponse(c, content_type="application/json")

def subcategoria(request,categoria,distrito):


	d = Distrito.objects.get(id=distrito)

	c= Subcategoria.objects.filter(categoria_id=categoria,visible=True).values('photo_icono','duracion_servicio','descuento','activar_descuento','id','nombre','descripcion','precio','photo','categoria_id','categoria__nombre').order_by('orden')

	for i in range(len(c)):

		c[i]['check']=False

		#c[i]['precio']=int(d.porcentaje_descuento)*c[i]['precio']/100

		if c[i]['descripcion'] == None: c[i]['descripcion']= ''
		if c[i]['precio'] == None: c[i]['precio']= ''
		if c[i]['descuento'] == None: c[i]['descuento']= 0

		c[i]['descripcion']=c[i]['descripcion']
		c[i]['precio_descuento']=round((100+c[i]['descuento'])*0.01*c[i]['precio'],1)

		_socia = Sociasubcategoria.objects.filter(subcategoria_id=c[i]['id']).values('sociacategoria_id','sociacategoria__titulo','sociacategoria__descripcion','socia__id','socia__email','socia__telefono','socia__photo','socia__nombre','socia__photo','socia__texperiencia','socia__descripcion_socia','socia__descripcion_titulo','socia__distrito__nombre','socia__estrellas')
		
		for x in range(len(_socia)):

			star=[]

			phone_number=_socia[x]['socia__telefono']

			if phone_number[:2] != '51' and len(phone_number)==9:

				phone_number = '51%s' % phone_number


			_socia[x]['socia__telefono'] = phone_number

			for st in range(5):

				print st,int(_socia[x]['socia__estrellas'])

				if int(st)+1 <= int(_socia[x]['socia__estrellas']):

					star.append('*')

					print '*'
					
				else:

					star.append('-')

					print '-'


			print '......'	
				

			_socia[x]['estrellas']=star

			_comentarios = Sociacomentario.objects.filter(socia_id=_socia[x]['socia__id']).values('comentario','cliente__nombre')

			_socia[x]['comentario']=ValuesQuerySetToDict(_comentarios)

			__photos=Sociacategoriaphoto.objects.filter(socia_id=_socia[x]['socia__id'],categoria_id=categoria).values('socia__id','photo')

			_socia[x]['photos']=ValuesQuerySetToDict(__photos)


		c[i]['socias']= ValuesQuerySetToDict(_socia)



	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")





@csrf_exempt
def obtienedistrito(request):

	if request.method=='POST':

		d= json.loads(request.body)['ubicacion'].split(',')[1].split(' ')

		d.pop(len(d)-1)

		d.pop(0)

		distri=''

		i=0

		for lo in d:

			i=i+1

			distri = distri+lo

			if i < len(d): 

				distri = distri + ' '

		print distri


		x=Distrito.objects.filter(nombre=distri)

		print x



		if x.count() >0:

			c= simplejson.dumps(x[0].id)

			return HttpResponse(c, content_type="application/json")

		else:

			c= simplejson.dumps(1)

			return HttpResponse(c, content_type="application/json")

@csrf_exempt
def infodistrito(request):

	if request.method=='POST':

		d= json.loads(request.body)['ubicacion']

		d=Distrito.objects.filter(id=d).values('latitud','longitud','nombre')

		c= simplejson.dumps(ValuesQuerySetToDict(d))

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def _subcategorias(request):


	#d = Distrito.objects.get(id=distrito)

	c= Subcategoria.objects.all().values('duracion_servicio','descuento','activar_descuento','id','nombre','descripcion','precio','photo','categoria_id','categoria__nombre').order_by('orden')

	for i in range(len(c)):

		c[i]['check']=False

		#c[i]['precio']=int(d.porcentaje_descuento)*c[i]['precio']/100

		if c[i]['descripcion'] == None: c[i]['descripcion']= ''
		if c[i]['precio'] == None: c[i]['precio']= ''
		if c[i]['descuento'] == None: c[i]['descuento']= 0

		c[i]['descripcion']=c[i]['descripcion']
		c[i]['precio_descuento']=round((100+c[i]['descuento'])*0.01*c[i]['precio'],1)

		_socia = Sociasubcategoria.objects.filter(subcategoria_id=c[i]['id']).values('socia__id','socia__email','socia__telefono','socia__photo','socia__nombre','socia__photo','socia__texperiencia','socia__descripcion_socia','socia__descripcion_titulo','socia__distrito__nombre','socia__estrellas')
		
		for x in range(len(_socia)):

			star=[]

			phone_number=_socia[x]['socia__telefono']

			if phone_number[:2] != '51' and len(phone_number)==9:

				phone_number = '51%s' % phone_number


			_socia[x]['socia__telefono'] = phone_number



			for st in range(5):



				if int(st)+1 <= int(_socia[x]['socia__estrellas']):

					star.append('*')


					
				else:

					star.append('-')



				

			_socia[x]['estrellas']=star

			_comentarios = Sociacomentario.objects.filter(socia_id=_socia[x]['socia__id']).values('comentario','cliente__nombre')

			_socia[x]['comentario']=ValuesQuerySetToDict(_comentarios)

		c[i]['socias']= ValuesQuerySetToDict(_socia)



	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")


@csrf_exempt
def activa_anuncio(request):

	if request.method=='GET':

		activa_anuncio=Configuracion.objects.get(id=1).activa_anuncio

		if activa_anuncio==True:

			activa_anuncio=1

		c= simplejson.dumps(activa_anuncio)



		return HttpResponse(c, content_type="application/json")


def distrito(request):

	c= Distrito.objects.all().values('id','nombre').exclude(id=1)

	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")

def portadaphoto(request,sexo):

	c= Portadaphoto.objects.all().values('id','nombre','photo','enlace')

	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")



def traepublicidad(request):

	c= Publicidad.objects.all().values('id','nombre','photo','enlace','sexo__nombre')

	c= simplejson.dumps(ValuesQuerySetToDict(c))

	return HttpResponse(c, content_type="application/json")


class Guardanotificacion(JSONWebTokenAuthMixin, View):

	#Crea nuevo cliente
	def post(self, request):


		#serviciox = json.loads(json.loads(request.body)['data'])['notification']['payload']['additionalData']

		serviciox=json.loads(request.body)['notification']['payload']['additionalData']


		#{u'action': {u'type': 0}, u'notification': {u'displayType': 0, u'shown': True, u'isAppInFocus': True, u'androidNotificationId': -656582595, u'payload': {u'body': u'Tienes un nuevo servicio requerido', u'lockScreenVisibility': 1, u'fromProjectNumber': u'466431784640', u'rawPayload': u'{"google.sent_time":1514838068314,"custom":"{\\"a\\":{\\"servicio\\":128},\\"i\\":\\"f04fde66-1544-4070-a212-67ec007e3b82\\"}","from":"466431784640","alert":"Tienes un nuevo servicio requerido","google.message_id":"0:1514838068319696%65d63aedf9fd7ecd","notificationId":-656582595}', u'priority': 0, u'additionalData': {u'servicio': 128}, u'notificationID': u'f04fde66-1544-4070-a212-67ec007e3b82'}}}

		#c= simplejson.dumps('servicio')

		#return HttpResponse(c, content_type="application/json")

		for s in serviciox:

			print 'servicio..',s

			if s=='codigo':

				if Socia.objects.filter(user_id=request.user.id):

					so = Socia.objects.get(user_id=request.user.id)
					so.numero_notificacion = serviciox['codigo']
					so.save()

				if Cliente.objects.filter(user_id=request.user.id):

					cli = Cliente.objects.get(user_id=request.user.id)
					cli.numero_notificacion = serviciox['codigo']
					cli.save()


				c= simplejson.dumps('ok')

				return HttpResponse(c, content_type="application/json")


			if s=='servicio':

				servicio= serviciox['servicio']
				
				#Notificacion(descripcion=json.loads(request.body),fecha=datetime.datetime.today(),servicio_id=servicio).save()

				servicio = {'servicio':servicio,'detalle':'cliente-socia'}


				print 'entre...'
				c= simplejson.dumps(servicio)

				return HttpResponse(c, content_type="application/json")

			if s=='aceptaservicio':

				print 'aceptaservicio....',s

				servicio= json.loads(json.loads(request.body)['data'])['notification']['payload']['additionalData']['aceptaservicio']
				
				#Notificacion(descripcion=json.loads(request.body),fecha=datetime.datetime.today(),servicio_id=servicio).save()

				servicio = {'servicio':servicio,'detalle':'aceptaservicio'}

				c= simplejson.dumps(servicio)

				return HttpResponse(c, content_type="application/json")


@csrf_exempt
def correccion(request):


	__personas =Personas.objects.all()

	for p in __personas:

		x= p.fecha_nacimiento.replace('text:u','').split('/')

		anio = x[0].split('-')[0]


		edad = 2018 - int(anio)
		print edad

		p.edad=edad
		p.save()
		# if int(len(x))>1:

		# 	dia = x[0]
		# 	mes=x[1]
		# 	anio=x[2]

		# 	f = anio+'-'+mes+'-'+dia

		# 	print p.id,f

		# 	p.fecha_nacimiento=f
		# 	p.save()


@csrf_exempt
def personas(request):


	xls_name = '/home/BD_4.xls'


	#Personas.objects.all().delete()

	book = xlrd.open_workbook(xls_name)

	sh = book.sheet_by_index(0)

	date =datetime.datetime.now()


	for rx in range(sh.nrows):

		if rx > 0:

			dni = str(sh.row(rx)[1]).replace("'","").replace("number:","").replace(".0","").replace("empty:u","")
			nombre = str(sh.row(rx)[3]).replace("'","").replace("text:u","") +' '+ str(sh.row(rx)[4]).replace("'","").replace("text:u","") +' '+ str(sh.row(rx)[5]).replace("'","").replace("text:u","")+' '+ str(sh.row(rx)[6]).replace("'","").replace("text:u","")
			direccion = str(sh.row(rx)[27]).replace("'","").replace("text:u","").replace("empty:u","")
			distrito = str(sh.row(rx)[26]).replace("'","").replace("text:u","").replace("empty:u","")
			telefono = str(sh.row(rx)[28]).replace("'","").replace("number:","").replace(".0","").replace("empty:u","")
			fijo = str(sh.row(rx)[29]).replace("'","").replace("number:","").replace(".0","").replace("empty:u","")
			trabajo = str(sh.row(rx)[30]).replace("'","").replace("number:","").replace(".0","").replace("empty:u","")
			email = str(sh.row(rx)[31]).replace("'","").replace("text:u","").replace("empty:u","")
			sexo = str(sh.row(rx)[7]).replace("'","").replace("text:u","").replace("empty:u","")
			fecha_nacimiento = str(sh.row(rx)[8]).replace("'","").replace("xldate:","").replace(".0","")


			py_date = xlrd.xldate.xldate_as_datetime(int(fecha_nacimiento), book.datemode)

			py_date= str(py_date).split(' ')[0]


			origen = 'Oeshle'

			nombre=nombre.replace("empty:u","")

			print dni,nombre,distrito,telefono,direccion

			Personas(origen=origen,fecha=date,fecha_nacimiento=py_date,dni=dni,nombre=nombre,direccion=direccion,distrito=distrito,telefono=telefono,sexo=sexo,email=email).save()

				


		print '.....'


	c= simplejson.dumps('ok')

	return HttpResponse(c, content_type="application/json")




		# number:1.0
		# number:44228162.0
		# number:1933522.0
		# text:u'NECIOSUP'
		# text:u'REQUE'
		# text:u'IVAN'
		# text:u'CRUZ'
		# text:u'M'
		# xldate:31174.0
		# number:18.0
		# text:u'CORRESPONDENCIA'
		# text:u'ACTIVA'
		# text:u'CAL.'
		# text:u'MAYTA CAPAC'
		# number:1154.0
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# text:u' '
		# number:140106.0
		# text:u'LA VICTORIA '
		# text:u'ENTRE AMAUTAS Y MAYTA CAPAC    '
		# number:960959472.0
		# empty:u''
		# empty:u''
		# empty:u''
		# text:u'4040710003412614'
		# text:u'NECIOSUP IVAN'
		# xldate:44773.0
