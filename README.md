# Flutter
- Frontend klasörüne girerek flutter projesini çalıştırabilirsiniz. Uygulama açıldığında Register kısmına girerek kullanıcı kaydı yapabilir, sonra
login yaparak anasayfada daha önce kaydolmuş kullanıcıları ve bilgilerini görebilirsiniz.


## Kurulum (.Net Core)

- Öncelikle backend klasörüne girerek Models içerisindeki DatabaseContext içerisindeki Server ve database kısmına kendi server ve database ismini yazmanız gerekiyor.
Daha sonra scriptini bıraktığım dbo.Users dosyasını kendi database'inizde(MSSQL) çalıştırmalısınız. Sonra projeyi çalıştırabilir ve postman'den ya da flutter projesini
de çalıştırarak apilerin çalışıp çalışmadığını kontrol edebilirsiniz.

## Endpoints

### POST
- http://localhost:5000/api/v1/Users/Register		/*bu Url'e istek atarak yeni bir kullanıcı ekleyebilirsiniz Eğer postman'de çalışıyorsanız aşağıdaki formatı takip edin */
{
	"firstName": "",
    "lastName": "",
    "email": "",
    "password": ""			/*Şifre 6 karakterden az olamaz*/
}

- http://localhost:5000/api/v1/Users/Login			/* bu Url'e istek atarak giriş yapabilirsiniz Bunun için aşağıdaki formatı takip edin */
{
    "email": "",
    "password": ""
}

### GET
- http://localhost:5000/api/v1/Users/GetUserById?id=? /* url'de id=? kısmındaki soru işaretine kullanıcı id yazarak o kullanıcının bilgilerini görebilirsiniz */ 

- http://localhost:5000/api/v1/Users/GetUsers		/* bu url'e istek atarak tüm kullanıcı bilgilerini görebilirsiniz */

