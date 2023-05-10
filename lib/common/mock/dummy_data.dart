import 'package:etrade_actions/features/shop/models/banner_model.dart';
import 'package:etrade_actions/features/shop/models/brand_model.dart';
import 'package:etrade_actions/features/shop/models/category_model.dart';
import 'package:etrade_actions/features/shop/models/product_attribute_model.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/models/product_variation_model.dart';
import 'package:etrade_actions/routes/routes.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';

class TDummyData {

  static final List<BannerModel> banners = [
  BannerModel(
    imageUrl: TImages.banner1,
    targetScreen: TRoutes.order,
    active: false,
  ),
  BannerModel(
    imageUrl: TImages.banner2,
    targetScreen: TRoutes.cart,
    active: true,
  ),
  BannerModel(
    imageUrl: TImages.banner3,
    targetScreen: TRoutes.favourites,
    active: true,
  ),
  BannerModel(
    imageUrl: TImages.banner4,
    targetScreen: TRoutes.search,
    active: true,
  ),
  BannerModel(
    imageUrl: TImages.banner5,
    targetScreen: TRoutes.settings,
    active: true,
  ),
  BannerModel(
    imageUrl: TImages.banner6,
    targetScreen: TRoutes.userAddress,
    active: true,
  ),
  BannerModel(
    imageUrl: TImages.banner8,
    targetScreen: TRoutes.checkout,
    active: false,
  ),
];

  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: TImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: TImages.furnitureIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: TImages.electronicsIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: TImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: TImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: TImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: TImages.cosmeticsIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      image: TImages.jeweleryIcon,
      name: 'Jewelery',
      isFeatured: true,
    ),
    // Subcategories
    CategoryModel(
      id: '8',
      image: TImages.sportIcon,
      name: 'Sport Shoes',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      image: TImages.sportIcon,
      name: 'Track suits',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: TImages.sportIcon,
      name: 'Sports Equipments',
      parentId: '1',
      isFeatured: false,
    ),
    // Furniture
    CategoryModel(
      id: '11',
      image: TImages.furnitureIcon,
      name: 'Bedroom furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: TImages.furnitureIcon,
      name: 'Kitchen furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: TImages.furnitureIcon,
      name: 'Office furniture',
      parentId: '5',
      isFeatured: false,
    ),
    // Electronics
    CategoryModel(
      id: '14',
      image: TImages.electronicsIcon,
      name: 'Laptop',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image: TImages.electronicsIcon,
      name: 'Mobile',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      image: TImages.clothIcon,
      name: 'Shirts',
      parentId: '3',
      isFeatured: false,
    ),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: "801",
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "802",
      title: 'Blue Nike Sports - UniSex',
      stock: 20,
      price: 120,
      isFeatured: true,
      thumbnail: TImages.productImage22,
      description: 'The active nike, sports shoe.',
      brand: BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.productImage22,
        TImages.productImage28,
      ],
      salePrice: 25,
      sku: 'ABR5679',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Blue', 'Black', 'White']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 36', 'EU 38', 'EU 40']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 25,
          price: 110,
          salePrice: 100,
          image: TImages.productImage22,
          description:
              'This is a Product description for Blue Adidas sports shoe.',
          attributeValues: {'Color': 'Blue', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 120,
          image: TImages.productImage22,
          description:
              'This is a Product description for Blue Adidas sports shoe.',
          attributeValues: {'Color': 'Blue', 'Size': 'EU 38'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 20,
          price: 120,
          image: TImages.productImage22,
          description:
              'This is a Product description for Blue Adidas sports shoe.',
          attributeValues: {'Color': 'Blue', 'Size': 'EU 40'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "803",
      title: 'Black Puma Running Shoes',
      stock: 10,
      price: 99,
      isFeatured: true,
      thumbnail: TImages.productImage20,
      description:
          'Black Puma running shoes with cushioned sole for extra comfort.',
      brand: BrandModel(
        id: '3',
        image: TImages.pumaLogo,
        name: 'Puma',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        TImages.productImage19,
        TImages.productImage20,
        TImages.productImage9,
      ],
      salePrice: 15,
      sku: 'PUMA7890',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Black', 'White', 'Gray']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 37', 'EU 38', 'EU 39']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '10',
          stock: 5,
          price: 99,
          image: TImages.productImage19,
          description: 'Black Puma running shoes, size EU 37.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 37'},
        ),
        ProductVariationModel(
          id: '11',
          stock: 3,
          price: 99,
          image: TImages.productImage20,
          description: 'Black Puma running shoes, size EU 38.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 38'},
        ),
        ProductVariationModel(
          id: '12',
          stock: 2,
          price: 99,
          image: TImages.productImage20,
          description: 'Black Puma running shoes, size EU 39.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 39'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "804",
      title: 'Red Zara Hoodie',
      stock: 30,
      price: 49,
      isFeatured: true,
      thumbnail: TImages.productImage24,
      description: 'Red Zara hoodie with front pocket and adjustable hood.',
      brand: BrandModel(
        id: '4',
        image: TImages.zaraLogo,
        name: 'Zara',
        productsCount: 300,
        isFeatured: true,
      ),
      images: [
        TImages.productImage24,
        TImages.productImage25,
        TImages.productImage26,
      ],
      salePrice: 10,
      sku: 'ZARA1234',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Black', 'Gray']),
        ProductAttributeModel(name: 'Size', values: ['XS', 'S', 'M']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '13',
          stock: 15,
          price: 49,
          image: TImages.productImage24,
          description: 'Red Zara hoodie, size XS.',
          attributeValues: {'Color': 'Red', 'Size': 'XS'},
        ),
        ProductVariationModel(
          id: '14',
          stock: 10,
          price: 49,
          image: TImages.productImage25,
          description: 'Red Zara hoodie, size S.',
          attributeValues: {'Color': 'Red', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '15',
          stock: 5,
          price: 49,
          image: TImages.productImage26,
          description: 'Red Zara hoodie, size M.',
          attributeValues: {'Color': 'Red', 'Size': 'M'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "805",
      title: 'White Apple AirPods Pro',
      stock: 50,
      price: 249,
      isFeatured: true,
      thumbnail: TImages.productImage31,
      description:
          'Wireless White Apple AirPods Pro with active noise cancellation.',
      brand: BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'Apple',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        TImages.productImage31,
        TImages.productImage32,
        TImages.productImage33,
      ],
      salePrice: 0, // No sale currently
      sku: 'APPRO456',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '16',
          stock: 50,
          price: 249,
          image: TImages.productImage31,
          description:
              'White Apple AirPods Pro with active noise cancellation.',
          attributeValues: {'Color': 'White'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "806",
      title: 'Black Samsung Galaxy Watch',
      stock: 20,
      price: 349,
      isFeatured: true,
      thumbnail: TImages.productImage11,
      description:
          'Black Samsung Galaxy Watch with AMOLED display and fitness tracking features.',
      brand: BrandModel(
        id: '6',
        image: TImages.samsungLogo,
        name: 'Samsung',
        productsCount: 80,
        isFeatured: true,
      ),
      images: [
        TImages.productImage11,
        TImages.productImage12,
        TImages.productImage13,
      ],
      salePrice: 0, // No sale currently
      sku: 'SAMGW123',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '17',
          stock: 20,
          price: 349,
          image: TImages.productImage11,
          description:
              'Black Samsung Galaxy Watch with AMOLED display and fitness tracking features.',
          attributeValues: {'Color': 'Black'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "807",
      title: 'Red Tennis Racket',
      stock: 15,
      price: 89,
      isFeatured: true,
      thumbnail: TImages.productImage30,
      description:
          'Red Tennis Racket suitable for beginners and intermediate players.',
      brand: BrandModel(
        id: '7',
        image: TImages.sportIcon,
        name: 'Wilson',
        productsCount: 50,
        isFeatured: true,
      ),
      images: [
        TImages.productImage30,
        TImages.productImage31,
      ],
      salePrice: 0, // No sale currently
      sku: 'WILTEN789',
      categoryId: '7',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '18',
          stock: 15,
          price: 89,
          image: TImages.productImage30,
          description:
              'Red Tennis Racket suitable for beginners and intermediate players.',
          attributeValues: {'Color': 'Red'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "808",
      title: 'Blue Leather Office Chair',
      stock: 10,
      price: 199,
      isFeatured: true,
      thumbnail: TImages.productImage39,
      description:
          'Blue Leather Office Chair with ergonomic design and adjustable features.',
      brand: BrandModel(
        id: '8',
        image: TImages.hermanMillerLogo,
        name: 'Herman Miller',
        productsCount: 30,
        isFeatured: true,
      ),
      images: [
        TImages.productImage39,
        TImages.productImage40,
      ],
      salePrice: 0, // No sale currently
      sku: 'HERMAN567',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '19',
          stock: 10,
          price: 199,
          image: TImages.productImage39,
          description:
              'Blue Leather Office Chair with ergonomic design and adjustable features.',
          attributeValues: {'Color': 'Blue'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "809",
      title: 'Green Cosmetics Set',
      stock: 25,
      price: 79,
      isFeatured: true,
      thumbnail: TImages.productImage5,
      description:
          'Green Cosmetics Set containing various skincare and makeup products.',
      brand: BrandModel(
        id: '9',
        image: TImages.cosmeticsIcon,
        name: 'L\'Oréal',
        productsCount: 60,
        isFeatured: true,
      ),
      images: [
        TImages.productImage5,
        TImages.productImage6,
      ],
      salePrice: 0, // No sale currently
      sku: 'LOREAL456',
      categoryId: '9',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '20',
          stock: 25,
          price: 79,
          image: TImages.productImage5,
          description:
              'Green Cosmetics Set containing various skincare and makeup products.',
          attributeValues: {'Color': 'Green'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "810",
      title: 'Gray Nike Tracksuit',
      stock: 20,
      price: 149,
      isFeatured: true,
      thumbnail: TImages.productImage24,
      description:
          'Gray Nike Tracksuit made with breathable fabric for maximum comfort.',
      brand: BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage24,
        TImages.productImage25,
      ],
      salePrice: 0, // No sale currently
      sku: 'NIKETRACK123',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Gray']),
        ProductAttributeModel(name: 'Size', values: ['XS', 'S', 'M']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '21',
          stock: 10,
          price: 149,
          image: TImages.productImage24,
          description: 'Gray Nike Tracksuit, size XS.',
          attributeValues: {'Color': 'Gray', 'Size': 'XS'},
        ),
        ProductVariationModel(
          id: '22',
          stock: 5,
          price: 149,
          image: TImages.productImage25,
          description: 'Gray Nike Tracksuit, size S.',
          attributeValues: {'Color': 'Gray', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '23',
          stock: 5,
          price: 149,
          image: TImages.productImage25,
          description: 'Gray Nike Tracksuit, size M.',
          attributeValues: {'Color': 'Gray', 'Size': 'M'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "811",
      title: 'Black Leather Office Bag',
      stock: 15,
      price: 199,
      isFeatured: true,
      thumbnail: TImages.productImage42,
      description:
          'Black Leather Office Bag with multiple compartments for organizing belongings.',
      brand: BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.productImage41,
        TImages.productImage42,
      ],
      salePrice: 0, // No sale currently
      sku: 'ADIDASBAG789',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '24',
          stock: 15,
          price: 199,
          image: TImages.productImage42,
          description:
              'Black Leather Office Bag with multiple compartments for organizing belongings.',
          attributeValues: {'Color': 'Black'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "812",
      title: 'Blue Sony Headphones',
      stock: 30,
      price: 129,
      isFeatured: true,
      thumbnail: TImages.productImage17,
      description:
          'Blue Sony Headphones with noise-canceling technology for immersive audio experience.',
      brand: BrandModel(
        id: '3',
        image: TImages.electronicsIcon,
        name: 'Sony',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        TImages.productImage16,
        TImages.productImage17,
      ],
      salePrice: 0, // No sale currently
      sku: 'SONYHP456',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '25',
          stock: 30,
          price: 129,
          image: TImages.productImage17,
          description:
              'Blue Sony Headphones with noise-canceling technology for immersive audio experience.',
          attributeValues: {'Color': 'Blue'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "813",
      title: 'White Nike T-shirt',
      stock: 25,
      price: 29,
      isFeatured: true,
      thumbnail: TImages.productImage54,
      description:
          'White Nike T-shirt made with soft cotton fabric for everyday comfort.',
      brand: BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage54,
        TImages.productImage55,
      ],
      salePrice: 0, // No sale currently
      sku: 'NIKETSHIRT123',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '26',
          stock: 10,
          price: 29,
          image: TImages.productImage54,
          description: 'White Nike T-shirt, size S.',
          attributeValues: {'Color': 'White', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '27',
          stock: 10,
          price: 29,
          image: TImages.productImage55,
          description: 'White Nike T-shirt, size M.',
          attributeValues: {'Color': 'White', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '28',
          stock: 5,
          price: 29,
          image: TImages.productImage55,
          description: 'White Nike T-shirt, size L.',
          attributeValues: {'Color': 'White', 'Size': 'L'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: "814",
      title: 'Black Leather Sofa',
      stock: 5,
      price: 799,
      isFeatured: true,
      thumbnail: TImages.productImage34,
      description:
          'Black Leather Sofa with recliner and cup holders for ultimate comfort.',
      brand: BrandModel(
        id: '4',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 400,
        isFeatured: true,
      ),
      images: [
        TImages.productImage33,
        TImages.productImage34,
      ],
      salePrice: 0, // No sale currently
      sku: 'IKEASOFA123',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '29',
          stock: 5,
          price: 799,
          image: TImages.productImage34,
          description:
              'Black Leather Sofa with recliner and cup holders for ultimate comfort.',
          attributeValues: {'Color': 'Black'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
