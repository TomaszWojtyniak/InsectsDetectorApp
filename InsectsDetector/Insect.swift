//
//  Insect.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 30/10/2024.
//

import Foundation

enum Insect: String, CaseIterable {
    case ant
    case bee
    case wasp
    case butterfly
    case ladybug
    case moth
    case bumblebee
    case fly
    case cockroach
    case graphosoma
    case mantis
    case mosquito
    case spider
    case scorpionfly
    
    static func matchInsect(insectName: String) -> Insect? {
        for insect in Insect.allCases {
            if insectName == insect.name {
                return insect
            }
        }
        return nil
    }
    
    var name: String {
        switch self {
        case .ant:
            String(localized: "Ant")
        case .bee:
            String(localized: "Bee")
        case .wasp:
            String(localized: "Wasp")
        case .butterfly:
            String(localized: "Butterfly")
        case .ladybug:
            String(localized: "Ladybug")
        case .moth:
            String(localized: "Moth")
        case .bumblebee:
            String(localized: "Bumblebee")
        case .fly:
            String(localized: "Fly")
        case .cockroach:
            String(localized: "Cockroach")
        case .graphosoma:
            String(localized: "Graphosoma")
        case .mantis:
            String(localized: "Mantis")
        case .mosquito:
            String(localized: "Mosquito")
        case .spider:
            String(localized: "Spider")
        case .scorpionfly:
            String(localized: "Scorpionfly")
        }
    }
    
    var imageName: String {
        switch self {
        case .ant:
            "ant"
        case .bee:
            "bee"
        case .wasp:
            "wasp"
        case .butterfly:
            "butterfly"
        case .ladybug:
            "ladybug"
        case .moth:
            "moth"
        case .bumblebee:
            "bumblebee"
        case .fly:
            "fly"
        case .cockroach:
            "cockroach"
        case .graphosoma:
            "graphosoma"
        case .mantis:
            "mantis"
        case .mosquito:
            "mosquito"
        case .spider:
            "spider"
        case .scorpionfly:
            "scorpionfly"
        }
    }
    
    var description: String {
        switch self {
        case .ant:
            String(localized: "Ants are industrious and social insects that belong to the family Formicidae. They live in well-organized colonies or nests with hierarchies comprising worker ants, soldiers, drones, and a queen. Ant colonies vary in size, from a few dozen individuals to millions, and are known for their remarkable strength; an ant can lift up to 50 times its body weight. Ants communicate and coordinate through pheromones, allowing them to work collectively to find food, protect their nest, and care for their young. Found on nearly every continent, ants play essential roles in their ecosystems, such as aerating soil and controlling other insect populations.")
        case .bee:
            String(localized: "Bees are vital pollinators from the Apoidea family, with over 20,000 species globally, including honeybees, bumblebees, and solitary bees. Known for their role in pollinating flowers and crops, bees contribute significantly to global food production. Honeybees, in particular, live in colonies led by a queen, with worker bees maintaining the hive, foraging for nectar, and protecting against threats. They produce honey and beeswax, prized for human use. Bees are currently facing threats due to habitat loss, pesticides, and climate change, highlighting their critical role in biodiversity and the environment.")
        case .wasp:
            String(localized: "Wasps are a diverse group of insects from the order Hymenoptera, which includes both solitary and social species. Known for their smooth bodies and narrow waists, wasps come in vibrant colors that often warn predators of their sting. Social wasps, like yellow jackets and hornets, build nests and work together, while solitary wasps, such as mud daubers, build individual nests. Wasps play a dual ecological role by acting as both predators, controlling pest populations, and pollinators. Despite their reputation, wasps are crucial for maintaining balanced ecosystems.")
        case .butterfly:
            String(localized: "Butterflies belong to the order Lepidoptera, known for their colorful wings and graceful flight. They undergo a complete metamorphosis: from egg to caterpillar (larva), then to a chrysalis (pupa), and finally to an adult butterfly. Butterflies play an essential role in pollinating plants, particularly flowering plants, and serve as indicators of healthy ecosystems. With over 17,500 species, butterflies vary widely in color, size, and behavior. They are sensitive to environmental changes, and some species migrate vast distances, such as the famous monarch butterfly.")
        case .ladybug:
            String(localized: "Ladybugs, or ladybirds, belong to the Coccinellidae family and are small beetles recognized by their bright red or yellow bodies adorned with black spots. Known as beneficial insects in agriculture, ladybugs are natural predators of aphids and other pests, helping protect crops and gardens. Some species, however, have adapted to different climates and become invasive. Ladybugs are symbols of good luck in many cultures, and their vibrant coloration acts as a warning to predators about their unappetizing taste and mild toxicity.")
        case .moth:
            String(localized: "Moths are close relatives of butterflies and also belong to the order Lepidoptera. While butterflies are often associated with the daytime, most moths are nocturnal, using the moon and stars for navigation. They range in size from tiny to large and are crucial in their ecosystems as pollinators and a food source for many animals. Moths are attracted to light, a behavior known as phototaxis, and their muted colors allow them to blend into their surroundings as camouflage. Some moths, like the hawk moth, can mimic their predators or appear larger to avoid attacks.")
        case .bumblebee:
            String(localized: "Bumblebees are large, furry bees known for their gentle nature and exceptional pollinating skills. Found primarily in cooler climates, they have robust, hairy bodies that make them highly efficient at pollinating certain plants, including tomatoes and peppers, through a process called “buzz pollination.” Bumblebee colonies are smaller than honeybee hives, with a single queen and fewer workers. They nest underground or in sheltered areas and, unlike honeybees, can sting multiple times if threatened. Bumblebees are critical for maintaining biodiversity and crop yields.")
        case .fly:
            String(localized: "Flies, belonging to the order Diptera, are known for their quick reflexes and ability to adapt to diverse environments. Their lifecycle progresses from egg to larva (maggot) to pupa and then adult, with some species reproducing in just a few days. Flies are often seen as pests, especially house flies, which can spread diseases. However, they play crucial ecological roles by aiding decomposition, serving as food for various animals, and even pollinating plants. Certain species, such as hoverflies, mimic bees and are highly beneficial as pest controllers.")
        case .cockroach:
            String(localized: "Cockroaches are resilient insects from the order Blattodea, with a history dating back over 300 million years. They are adaptable and can survive in diverse and extreme conditions, even going without food for weeks. Though often viewed as pests, cockroaches are important scavengers, breaking down decaying organic matter. They have a high reproductive rate and are highly resistant to radiation. While some species infest human habitats, many live outdoors and play a role in nutrient cycling in ecosystems.")
        case .graphosoma:
            String(localized: "Graphosoma, also known as the Italian striped bug or shield bug, belongs to the Pentatomidae family. With their distinctive red and black stripes, these bugs are easily recognizable. They feed on plants, primarily of the carrot family, and emit a characteristic odor when disturbed as a defense mechanism. Their colors are a form of aposematism, signaling to potential predators that they might taste unpleasant.")
        case .mantis:
            String(localized: "Mantises, from the order Mantodea, are fascinating predatory insects characterized by their upright stance and folded, grasping front legs, which give them a “praying” appearance. Known for their patience and speed, they lie in wait for unsuspecting prey and strike with lightning-fast reflexes. Mantises use camouflage to blend into their surroundings and are excellent at controlling pest populations. Females sometimes exhibit sexual cannibalism, consuming their mates after reproduction.")
        case .mosquito:
            String(localized: "Mosquitoes are small flying insects belonging to the Culicidae family and are notorious for their blood-feeding behavior. Only female mosquitoes bite, as they need protein from blood to produce eggs. They are vectors for diseases such as malaria, dengue fever, and West Nile virus, making them one of the most dangerous insects to humans. Despite their reputation, mosquitoes serve as food for various species, such as birds and bats, and their larvae help recycle nutrients in aquatic ecosystems.")
        case .spider:
            String(localized: "Although not technically an insect, spiders are arachnids from the class Arachnida and play a crucial role in pest control. With eight legs and multiple eyes, spiders have evolved diverse methods of hunting, from weaving intricate webs to ambushing prey. Spiders produce silk, used for various purposes, including web construction, creating egg sacs, and catching prey. They are found in nearly every habitat on Earth and are important indicators of biodiversity and environmental health.")
        case .scorpionfly:
            String(localized: "Scorpionflies belong to the order Mecoptera and are named for the males’ scorpion-like tail, which is actually harmless and used in courtship displays. These insects are known for their elongated, beak-like mouths, which they use to feed on dead insects, decaying organic matter, and sometimes nectar. Scorpionflies are often found in humid environments and play a role in the decomposition process, acting as recyclers in ecosystems.")
        }
    }
}
