def ve a,b
  (a==1 && b==1) ? 1 : 0
end
def xor a, b
  a == b ? s = 0 : s = 1
end
def xnor a, b
  a == b ? s = 1 : s = 0
end
def veya a, b
  (a==0 && b==0) ? 0 : 1
end

def topla a, b, e = 0
  if e == 0
    sonuc = xor a, b
    elde = ve a, b
  else # e==1
    sonuc = xnor a, b
    elde = veya a, b
  end
  x = [sonuc,elde]
end

def ters_cevir a
  s = ""
  (0..(a.size-1)).each do |i|
    a[i].to_i == 1 ? s << "0" : s << "1"
  end
  s
end

def cikarma a,b
  sonuc = ""
  if a > b
    b = toplama(ters_cevir(b.to_s(2).rjust(10,'0')).to_i(2),1).to_s(2).rjust(10,'0').to_i(2)
    a = a.to_s(2).rjust(10,'0').to_i(2)
  else
    sonuc << "-"
    a = toplama(ters_cevir(a.to_s(2).rjust(10,'0')).to_i(2),1).to_s(2).rjust(10,'0').to_i(2)
    b = b.to_s(2).rjust(10,'0').to_i(2)
  end
  sonuc << toplama(a,b).to_s
end

def toplama a,b
  t = a.to_s(2).rjust(10,'0')
  k = b.to_s(2).rjust(10,'0')
  sonuc = ""
  elde = 0
  eldem = ""
  (0..(k.size-1)).reverse_each do |i|
    z = topla t[i].to_i, k[i].to_i, elde
    sonuc << z[0].to_s
    elde = z[1]
    eldem << z[1].to_s
  end
  return sonuc.reverse.to_i(2)
end
print "ilk sayıyı giriniz : "
a = gets.to_i
print "ikinci sayıyı giriniz : "
b = gets.to_i
puts "1 - Toplama"
puts "2 - Çıkarma"
islem = gets.to_i
if islem==1
  puts "Sonuc : " + toplama(a,b)
elsif islem==2
  puts "Sonuc : " + cikarma(a,b)
else
  puts "Güncellemeler üzerine çalışılıyor...","Bilgisayarınızı kapatmayınız..."
end
