from datetime import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render
from p3app.models import *

# Create your views here.
def main(request):
    return render(request,'login.html')
def logins(request):
    uname=request.POST['textfield']
    password=request.POST['textfield2']
    ob=login.objects.get(username=uname,password=password)
    if ob.type=='admin':
        request.session['lid']=ob.id
        ob1=auth.authenticate(username='admin',password='admin')
        auth.login(request,ob1)
        return HttpResponse('''<script>alert("welcome admin");window.location='admhome'</script>''')
    elif ob.type=='pharmacy':
        request.session['lid']=ob.id
        ob1 = auth.authenticate(username='admin', password='admin')
        auth.login(request, ob1)
        return HttpResponse('''<script>alert("welcome pharmacy");window.location='pharhome'</script>''')
    elif ob.type=='user':
        request.session['lid'] = ob.id
        ob1 = auth.authenticate(username='admin', password='admin')
        auth.login(request, ob1)
        return HttpResponse('''<script>alert("welcome user");window.location='/userhome'</script>''')
    else:
        return HttpResponse('''<script > alert("invalid "); window.location = '/'</script>''')





def admhome(request):
    return render(request,'Adminhome.html')
def signup(request):
    return render(request,'Registration.html')
def sign(request):
    sname=request.POST['textfield']
    place=request.POST['textfield2']
    pin = request.POST['textfield3']
    post = request.POST['textfield4']
    dis = request.POST['textfield5']
    phone = request.POST['textfield6']
    email = request.POST['textfield7']
    cer = request.FILES['file']
    fp = FileSystemStorage()
    fs= fp.save(cer.name, cer)
    username = request.POST['textfield8']
    password = request.POST['textfield9']
    lob=login()
    lob.username=username
    lob.password=password
    lob.type='pending'
    lob.save()
    pob=pharmacy()
    pob.lid=lob
    pob.pharmacyname=sname
    pob.place=place
    pob.pin=pin
    pob.post=post
    pob.district=dis
    pob.phone=phone
    pob.email=email
    pob.certificate=cer
    pob.save()
    return HttpResponse('''<script>alert("Successfully signup");window.location='/'</script>''')


@login_required(login_url='/')
def verifypharamacy(request):
    ob=pharmacy.objects.all()
    return render(request,'Verify Pharamacy.html',{'val':ob})
@login_required(login_url='/')
def accept(request,id):
    ob=login.objects.get(id=id)
    ob.type='pharmacy'
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location='/verifypharamacy'</script>''')
@login_required(login_url='/')
def reject(request,id):
    ob=login.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location='/verifypharamacy'</script>''')
@login_required(login_url='/')
def viewfeed(request):
    ob=feedback.objects.all()
    return render(request,'Viewfeedback.html',{'val':ob})



def pharhome(request):
    return render(request,'pharamacyhome.html')

@login_required(login_url='/')
def addmangemedi(request):
    ob=medicine.objects.all()
    return render(request,'Add&Managemedicines.html',{'val':ob})
@login_required(login_url='/')
def addmedi(request):
    return render(request,'AddMedicine.html')
@login_required(login_url='/')
def medi(request):
    mediname=request.POST['textfield']
    sto=request.POST['textfield3']
    des=request.POST['textfield2']
    exp=request.POST['textfield4']
    mob=medicine()
    mob.pid = pharmacy.objects.get(lid__id=request.session['lid'])
    mob.medicinename=mediname
    mob.stock=sto
    mob.description=des
    mob.expdate=exp
    mob.save()
    return HttpResponse('''<script>alert("Added");window.location='/addmangemedi'</script>''')
@login_required(login_url='/')
def edits(request,id):
    request.session['mid']=id
    ob=medicine.objects.get(id=id)
    return render(request,'Editmedicine.html',{'val':ob})
@login_required(login_url='/')
def editt(request):
    mediname = request.POST['textfield']
    sto = request.POST['textfield3']
    des = request.POST['textfield2']
    exp = request.POST['textfield4']
    mob = medicine.objects.get(id=request.session['mid'])
    mob.pid = pharmacy.objects.get(lid__id=request.session['lid'])
    mob.medicinename = mediname
    mob.stock = sto
    mob.description = des
    mob.expdate = exp
    mob.save()
    return HttpResponse('''<script>alert("Edited");window.location='/addmangemedi'</script>''')
@login_required(login_url='/')
def delete(request,id):
    ob=medicine.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/addmangemedi'</script>''')


@login_required(login_url='/')
def viewcomp(request):
    ob=complaint.objects.all()
    return render(request,'Viewcomplaints.html',{'val':ob})
@login_required(login_url='/')
def sdreply(request,cid):
    ob=complaint.objects.get(id=cid)
    request.session['cid']=cid
    return render(request,'replycom.html',{'val':ob})
@login_required(login_url='/')
def replys(request):
    replys=request.POST['textfield']
    ob=complaint.objects.get(id=request.session['cid'])
    ob.reply=replys
    ob.save()
    return HttpResponse('''<script>alert("replyed");window.location="pharhome"</script>''')
@login_required(login_url='/')
def vieworder(request):
    ob=medicineorder.objects.all()
    return render(request,'vieworder.html',{'val':ob})
@login_required(login_url='/')
def accept(request,id):
    ob=medicineorder.objects.get(id=id)
    ob.status='accept'
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location="/vieworder"</script>''')

@login_required(login_url='/')
def reject(request,id):
    ob=medicineorder.objects.get(id=id)
    ob.status='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location="/vieworder"</script>''')

@login_required(login_url='/')
def upvid(request):
    return render(request,'videoupload.html')
@login_required(login_url='/')
def videos(request):
    vid=request.FILES['file']
    ff=FileSystemStorage()
    fl=ff.save(vid.name,vid)
    vi=video()
    vi.video=fl
    vi.save()

    return HttpResponse('''<script>alert("uploaded");window.location="/pharhome"</script>''')
@login_required(login_url='/')
def viewfile(request):
    ob=bill.objects.all()
    return render(request,'viewfile.html',{'val':ob})











def userhome(request):
    return render(request,'userhome.html')
def uregistration(request):

    return render(request,'userregistration.html')
def register(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    gen=request.POST['radiobutton']
    pla=request.POST['textfield3']
    post=request.POST['textfield4']
    pin=request.POST['textfield5']
    phon=request.POST['textfield6']
    email=request.POST['textfield7']
    username=request.POST['textfield8']
    password=request.POST['textfield9']
    ob=login()
    ob.username=username
    ob.password=password
    ob.type='user'
    ob.save()
    uob=user()
    uob.firstname=fname
    uob.lastname=lname
    uob.gender=gen
    uob.place=pla
    uob.post=post
    uob.pin=pin
    uob.phone=phon
    uob.email=email
    uob.lid=ob
    uob.save()
    return HttpResponse('''<script>alert("Registered successfully ");window.location='/'</script>''')
@login_required(login_url='/')
def viewpharmacy(request):
    ob=pharmacy.objects.all()
    return render(request,'viewpharmacy&order.html',{'val':ob})
@login_required(login_url='/')
def viewmedi(request):
    ob=medicine.objects.all()
    return render(request, 'viewmedicine.html', {'val': ob})
@login_required(login_url='/')
def orders(request,id):
    request.session['oid']=id
    ob=medicine.objects.get(id=id)
    return render(request,'order.html',{'val':ob})
@login_required(login_url='/')
def orderd(request):
    qnty=request.POST['textfield']
    ob=medicineorder()
    ob.quantity=qnty
    ob.mid=medicine.objects.get(id=request.session['oid'])
    ob.uid=user.objects.get(lid__id=request.session['lid'])
    ob.status='pending'
    ob.date=datetime.today()
    ob.save()
    return HttpResponse('''<script>alert("Orderd successfully ");window.location='/viewpharmacy'</script>''')
@login_required(login_url='/')
def sendcomplaints(request):
    ob=pharmacy.objects.all()
    return render(request,'pharamacycomplaint.html',{'val':ob})
@login_required(login_url='/')
def complaintss(request):
    comp=request.POST['textfield']
    pha=request.POST['select']
    ob=complaint()
    ob.complaints=comp
    ob.date=datetime.today()
    ob.pid = pharmacy.objects.get(id=pha)

    ob.uid=user.objects.get(lid__id=request.session['lid'])
    ob.reply='pending'
    ob.save()
    return HttpResponse('''<script>alert("send complaint");window.location="userhome"</script>''')

@login_required(login_url='/')
def sdfile(request):
    ob=user.objects.all()
    return render(request,'sendfile.html',{'val':ob})
@login_required(login_url='/')
def files(request):
    patient=request.POST['select']
    fi = request.FILES['file']
    gh = FileSystemStorage()
    kk = gh.save(fi.name, fi)
    ob = bill()
    ob.uid=user.objects.get(id=patient)
    ob.file=kk
    ob.date=datetime.today()
    ob.pid=pharmacy.objects.get(lid__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("send files");window.location="pharhome"</script>''')




@login_required(login_url='/')
def sendfeedback(request):
    return render(request,'sendfeedback.html')
@login_required(login_url='/')
def feed(request):
    feedb=request.POST['textfield']
    ob=feedback()
    ob.feedbacks=feedb
    ob.date=datetime.today()
    ob.uid=user.objects.get(lid__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("send feedback");window.location="userhome"</script>''')
@login_required(login_url='/')
def viewvid(request):
    ob=video.objects.all()
    return render(request,'viewvideo.html',{'val':ob})
@login_required(login_url='/')
def orderstatus(request):
    ob=medicineorder.objects.all()
    return render(request,'orderstatus.html',{'val':ob})

# def acceptord(request,id):
#     ob=medicineorder.objects.get(id=id)
#     ob.status='accept'
#     ob.save()
#     return HttpResponse('''<script>alert("Accepted");window.location="/orderstatus"</script>''')
#
#
# def rejectord(request,id):
#     ob=medicineorder.objects.get(id=id)
#     ob.status='reject'
#     ob.save()
#     return HttpResponse('''<script>alert("Rejected");window.location="/orderstatus"</script>''')
#


def logout(request):
    auth.logout(request)
    return render(request,'login.html')