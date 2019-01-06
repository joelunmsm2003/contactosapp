# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-04-08 16:39
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0072_auto_20180408_1128'),
    ]

    operations = [
        migrations.CreateModel(
            name='Personas',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
                ('apellido', models.CharField(blank=True, max_length=1000, null=True)),
                ('edad', models.CharField(blank=True, max_length=1000, null=True)),
                ('telefono', models.CharField(blank=True, max_length=1000, null=True)),
                ('email', models.CharField(blank=True, max_length=1000, null=True)),
                ('direccion', models.CharField(blank=True, max_length=1000, null=True)),
                ('distrito', models.CharField(blank=True, max_length=1000, null=True)),
                ('fijo', models.CharField(blank=True, max_length=1000, null=True)),
                ('sexo', models.CharField(blank=True, max_length=1000, null=True)),
                ('dni', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'verbose_name': 'Publicidad',
                'managed': True,
            },
        ),
        migrations.AlterModelOptions(
            name='publicidad',
            options={'managed': True, 'verbose_name': 'Publicidad Externa'},
        ),
        migrations.RenameField(
            model_name='publicidad',
            old_name='apellido',
            new_name='enlace',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='direccion',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='distrito',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='dni',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='edad',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='email',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='fijo',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='sexo',
        ),
        migrations.RemoveField(
            model_name='publicidad',
            name='telefono',
        ),
        migrations.AddField(
            model_name='publicidad',
            name='photo',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
    ]
