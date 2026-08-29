import requests

from bs4 import BeautifulSoup

#function to get Data from url

def request_Product(request_item):

    url="https://mdcomputers.in/"

    params={
           "route":"product/search/",
           "search":request_item
           }

    response=requests.get(url,params=params)

    #Parsing Html Data

    soup=BeautifulSoup(response.text,"html.parser")
	
    #Selecting Product Details

    products=soup.select(".product_layout")

    results=[]

    for product in results:

        pro_name=product.select_one(".name a")

        pro_price=product.select_one(".price")

        if pro_name:
            name=pro_name.get_text(strip=True)
        else:
	    name="N/A"
        if pro_price:
            price=pro_price.get_text(" ",strip=True)
	else:
	    price="N/A"
        results.append({"name":name,"price":price})

    return results

request_item=input("Enter Search Item")
products=request_Product(request_item)

for product in products:
    print("name :" ,product["name"])
    print("price :",product["price"])
