# Generated by Django 3.2.8 on 2022-12-23 03:22

from django.db import migrations, models
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Voucher',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('is_activate', models.BooleanField(default=True)),
                ('name', models.CharField(max_length=100)),
                ('rate', models.DecimalField(decimal_places=2, max_digits=4)),
            ],
            options={
                'db_table': 'voucher',
                'ordering': ['-created_at'],
            },
        ),
    ]