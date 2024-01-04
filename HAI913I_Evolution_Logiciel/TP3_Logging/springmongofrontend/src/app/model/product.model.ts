// product.model.ts
export class Product {
    productId: string;
    name: string;
    price: number;
    expirationDate: string;
  
    constructor(productId: string, name: string, price: number, expirationDate: string) {
      this.productId = productId;
      this.name = name;
      this.price = price;
      this.expirationDate = expirationDate;
    }
  }
  