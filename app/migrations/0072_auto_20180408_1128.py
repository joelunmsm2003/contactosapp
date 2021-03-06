# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-04-08 16:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0071_sociasubcategoria_validar'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='publicidad',
            options={'managed': True, 'verbose_name': 'Publicidad'},
        ),
        migrations.RenameField(
            model_name='publicidad',
            old_name='enlace',
            new_name='apellido',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='photo',
        ),
        migrations.AddField(
            model_name='publicidad',
            name='direccion',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='distrito',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='dni',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='edad',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='email',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='fijo',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='sexo',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='publicidad',
            name='telefono',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
