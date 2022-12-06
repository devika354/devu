from django.db import models


# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=20)
    password=models.CharField(max_length=20)
    type=models.CharField(max_length=20)


class user(models.Model):
    firstname=models.CharField(max_length=20)
    lastname=models.CharField(max_length=20)
    gender=models.CharField(max_length=20)
    place=models.CharField(max_length=20)
    post=models.CharField(max_length=20)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    email=models.EmailField()
    lid=models.ForeignKey(login,on_delete=models.CASCADE)

class pharmacy(models.Model):
    pharmacyname=models.CharField(max_length=20)
    place=models.CharField(max_length=20)
    pin=models.IntegerField()
    post=models.CharField(max_length=20)
    district=models.CharField(max_length=20)
    phone=models.BigIntegerField()
    email=models.EmailField()
    certificate=models.FileField()
    lid=models.ForeignKey(login,on_delete=models.CASCADE)

class medicine(models.Model):
    medicinename=models.CharField(max_length=20)
    stock=models.IntegerField()
    description=models.CharField(max_length=20)
    expdate=models.DateField()
    pid=models.ForeignKey(pharmacy,on_delete=models.CASCADE)

class complaint(models.Model):
    complaints=models.CharField(max_length=20)
    date=models.DateField()
    reply=models.CharField(max_length=20)
    uid=models.ForeignKey(user,on_delete=models.CASCADE)
    pid=models.ForeignKey(pharmacy,on_delete=models.CASCADE)

class feedback(models.Model):
    feedbacks=models.CharField(max_length=20)
    date=models.DateField()
    uid=models.ForeignKey(user,on_delete=models.CASCADE)

class medicineorder(models.Model):
    mid=models.ForeignKey(medicine,on_delete=models.CASCADE)
    uid=models.ForeignKey(user,on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=20)
    quantity=models.IntegerField()

class video(models.Model):
    video=models.FileField()

class bill(models.Model):
    file=models.FileField()
    date=models.DateField()
    uid=models.ForeignKey(user,on_delete=models.CASCADE)
    pid=models.ForeignKey(pharmacy,on_delete=models.CASCADE)




