# Generated by Django 2.2.1 on 2019-05-17 14:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('libro', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='LibroUsuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estado', models.CharField(choices=[('LD', 'Leído'), ('LR', 'Leer'), ('CM', 'Comprar'), ('AB', 'Abandonado')], max_length=2)),
                ('dia', models.DateField()),
                ('libro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='libro.Libro')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('genero', models.ManyToManyField(blank=True, null=True, to='libro.Genero')),
                ('libro', models.ManyToManyField(blank=True, null=True, through='usuario.LibroUsuario', to='libro.Libro')),
                ('usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Ranking',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tiempo', models.CharField(choices=[('SM', 'Semanal'), ('MN', 'Mensual'), ('AN', 'Anual')], max_length=2)),
                ('cantidad', models.IntegerField()),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='usuario.Usuario')),
            ],
        ),
        migrations.AddField(
            model_name='librousuario',
            name='usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='usuario.Usuario'),
        ),
        migrations.CreateModel(
            name='Libreria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.TextField()),
                ('estantes', models.IntegerField()),
                ('libro', models.ManyToManyField(to='libro.Libro')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='usuario.Usuario')),
            ],
        ),
    ]
