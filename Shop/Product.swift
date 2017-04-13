//
//  Product.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

struct Product: Hashable {
    
    let id: String
    let name: String
    let description: String
    let unit : Unit
    let unitPrice: Price
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    var hashValue: Int {
        return id.hashValue
    }
    
}


extension Product {
    
    static func availableProducts() -> [Product] {
        var products = [Product]()
        
        // Peas : $ 0,95 per bag
        let peas = Product(id: "peas_id", name: "Peas", description: "The pea is most commonly the small spherical seed or the seed-pod of the pod fruit Pisum sativum.[2] Each pod contains several peas. Pea pods are botanically fruit,[3] since they contain seeds and developed from the ovary of a (pea) flower. The name is also used to describe other edible seeds from the Fabaceae such as the pigeon pea (Cajanus cajan), the cowpea (Vigna unguiculata), and the seeds from several species of Lathyrus.  P. sativum is an annual plant, with a life cycle of one year. It is a cool-season crop grown in many parts of the world; planting can take place from winter to early summer depending on location. The average pea weighs between 0.1 and 0.36 grams.[4] The immature peas (and in snow peas the tender pod as well) are used as a vegetable, fresh, frozen or canned; varieties of the species typically called field peas are grown to produce dry peas like the split pea shelled from the matured pod. These are the basis of pease porridge and pea soup, staples of medieval cuisine; in Europe, consuming fresh immature green peas was an innovation of Early Modern cuisine.  The wild pea is restricted to the Mediterranean basin and the Near East. The earliest archaeological finds of peas date from the late neolithic era of current Greece, Syria, Turkey and Jordan. In Egypt, early finds date from ca. 4800–4400 BC in the Nile delta area, and from ca. 3800–3600 BC in Upper Egypt. The pea was also present in Georgia in the 5th millennium BC. Farther east, the finds are younger. Peas were present in Afghanistan ca. 2000 BC, in Harappa, Pakistan, and in northwest India in 2250–1750 BC. In the second half of the 2nd millennium BC, this pulse crop appears in the Ganges Basin and southern India.[5]", unit: .Bag, unitPrice: Price(amount: 0.95, currency: .USD))
        products.append(peas)
        
        
        // Eggs : $ 2,10 per dozen
        let eggs = Product(id: "eggs_id", name: "🥚🥚", description: "An 🥚 is the organic vessel containing the zygote in which an animal embryo develops until it can survive on its own, at which point the animal hatches. An egg results from fertilization of an ovum. Most arthropods, vertebrates, and mollusks lay eggs, although some do not, such as scorpions and most mammals.  Reptile eggs, bird eggs, and monotreme eggs are laid out of water, and are surrounded by a protective shell, either flexible or inflexible. Eggs laid on land or in nests are usually kept within a favorable temperature range (warm) while the embryo grows. When the embryo is adequately developed it hatches, i.e. breaks out of the egg's shell. Some embryos have a temporary egg tooth with which to crack, pip, or break the eggshell or covering.  The largest recorded egg is from a whale shark, and was 30 cm × 14 cm × 9 cm (11.8 in × 5.5 in × 3.5 in) in size;[1] whale shark eggs normally hatch within the mother. At 1.5 kg (3.3 lb) and up to 17.8 cm × 14 cm (7.0 in × 5.5 in), the ostrich egg is the largest egg of any living bird,[2] though the extinct elephant bird and some dinosaurs laid larger eggs. The bee hummingbird produces the smallest known bird egg, which weighs half of a gram (around 0.02 oz). The eggs laid by some reptiles and most fish can be even smaller, and those of insects and other invertebrates can be much smaller still.  Reproductive structures similar to the egg in other kingdoms are termed 'spores,' or in spermatophytes 'seeds,' or in gametophytes 'egg cells'.", unit: .Dozen, unitPrice: Price(amount: 2.10, currency: .USD))
        products.append(eggs)
        
        // Milk : $ 1,30 per bottle
        let milk = Product(id: "milk_id", name: "🥛", description: "🥛 is a pale liquid produced by the mammary glands of mammals. It is the primary source of nutrition for infant mammals (including humans who breastfeed) before they are able to digest other types of food. Early-lactation milk contains colostrum, which carries the mother's antibodies to its young and can reduce the risk of many diseases. It contains many other nutrients[1] including protein and lactose.  As an agricultural product, milk is extracted from non-human mammals during or soon after pregnancy. Dairy farms produced about 730 million tonnes of milk in 2011,[2] from 260 million dairy cows.[3] India is the world's largest producer of milk, and is the leading exporter of skimmed milk powder, yet it exports few other milk products.[4][5] The ever increasing rise in domestic demand for dairy products and a large demand-supply gap could lead to India being a net importer of dairy products in the future.[6] The United States, India, China and Brazil are the world's largest exporters of milk and milk products.[7] China and Russia were the world's largest importers of milk and milk products until 2016 when both countries became self-sufficient, contributing to a worldwide glut of milk.[8]  Throughout the world, there are more than six billion consumers of milk and milk products. Over 750 million people live in dairy farming households.[9]", unit: .Bottle, unitPrice: Price(amount: 1.3, currency: .USD))
        products.append(milk)
        
        // Beans : $ 0,73 per can
        let beans = Product(id: "beans_id", name: "Beans", description: "The word 'bean' and its Germanic cognates (e.g., Bohne) have existed in common use in West Germanic languages since before the 12th century,[1] referring to broad beans and other pod-borne seeds. This was long before the New World genus Phaseolus was known in Europe. After Columbian-era contact between Europe and the Americas, use of the word was extended to pod-borne seeds of Phaseolus, such as the common bean and the runner bean, and the related genus Vigna. The term has long been applied generally to many other seeds of similar form,[1][2] such as Old World soybeans, peas, chickpeas (garbanzo beans), other vetches, and lupins, and even to those with slighter resemblances, such as coffee beans, vanilla beans, castor beans, and cocoa beans. Thus the term 'bean' in general usage can mean a host of different species.[3]  Seeds called 'beans' are often included among the crops called 'pulses' (legumes),[1] although a narrower prescribed sense of 'pulses' reserves the word for leguminous crops harvested for their dry grain. The term bean usually excludes legumes with tiny seeds and which are used exclusively for forage, hay, and silage purposes (such as clover and alfalfa). According to the United Nations Food and Agriculture Organization the term bean should include only species of Phaseolus; however, enforcing that prescription has proven difficult for several reasons. One is that in the past, several species, including Vigna angularis (adzuki bean), mungo (black gram), radiata (green gram), and aconitifolia (moth bean), were classified as Phaseolus and later reclassified. Another is that it is not surprising that the prescription on limiting the use of the word, because it tries to replace the word's older senses with a newer one, has never been consistently followed in general usage.", unit: .Can, unitPrice: Price(amount: 0.73, currency: .USD))
        products.append(beans)
        
        return products
    }
    
}

extension NumberFormatter {
    
    func productUnitPriceString(product: Product) -> String {
        let priceString = string(from: product.unitPrice)
        return "\(priceString ?? "0") / \(product.unit.rawValue)"
    }
}
