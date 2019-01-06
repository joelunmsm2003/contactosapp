from django.contrib.auth.models import User
from app.models import *
from rest_framework import serializers




class SubcategoriaSerializer(serializers.ModelSerializer):

	#tipo_agente = serializers.StringRelatedField(many=True, read_only=True)
	
	class Meta:
		model = Subcategoria
		fields = '__all__'


class SociaSerializer(serializers.ModelSerializer):

	class Meta:
		model = Socia
		fields = ('id','nombre','whatsapp','telefono','email')

class CategoriaSerializer(serializers.ModelSerializer):

	class Meta:
		model = Categoria
		fields = ('id','nombre','photo')

class SociasubcategoriaSerializer(serializers.ModelSerializer):

	subcategoria = SubcategoriaSerializer(many=False, read_only=True)
	
	class Meta:
		model = Sociasubcategoria
		fields = ('id','subcategoria')


class MianunciosSerializer(serializers.ModelSerializer):

	socia = SociaSerializer(many=False, read_only=True)
	categoria = CategoriaSerializer(many=False, read_only=True)
	sociasubcategoria = SociasubcategoriaSerializer(many=True, read_only=True)

	class Meta:
		model = Sociacategoria
		fields = ('id','socia','titulo','descripcion','categoria','costo','sociasubcategoria')


