Config = {
    Events = {
        ["Shots Fired"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Shots fired ~w~by a ~r~",
                    "sex",
                    "preveh",
                    "pcname",
                    "scname",
                    "vehName",
                    "plate",
                    "street1",
                    "street2" 
                },
                ["Officer"] = {
                    "~r~Shots fired",
                    "street1",
                    "street2" 
                }
            },
            Colour = 1, --sets the colour of both the static blip and the outlaw blip
            BlipTime = 60, --the time it takes for the static blip to fade away to nothing
            Outlaw = true, --sets whether an outlaw blip will be created for this event
            OutlawTime = 60, --the time it takes for the outlaw blip to fade away to nothing
            Chance = 50, --percentage that the event will trigger an alert
            Populated = true, --sets whether the event needs to take place in a populated zone in order to trigger an alert
            OwnershipCheck = false, --sets whether the ownership of the vehicle is taken into account for the alert chance
            Waittime = 5 --sets the minimum time between alerts for this event for each player
        },
        ["Civil Disturbance"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Civil Disturbance ~w~involving a ~r~",
                    "sex",
                    "preveh",
                    "pcname",
                    "scname",
                    "vehName",
                    "plate",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Civil Disturbance",
                    "street1",
                    "street2"
                }
            },
            Colour = 17,
            BlipTime = 60,
            Outlaw = true,
            OutlawTime = 60,
            Chance = 20,
            Populated = true,
            OwnershipCheck = false,
            Waittime = 5
        },
        ["Grand Theft Auto"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Grand Theft Auto ~w~of a ~r~",
                    "pcname",
                    "scname",
                    "vehName",
                    "plate",
                    "~w~ by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Grand Theft Auto",
                    "street1",
                    "street2"
                }
            },
            Colour = 5,
            BlipTime = 60,
            Outlaw = true,
            OutlawTime = 60,
            Chance = 75,
            Populated = false,
            OwnershipCheck = true,
            Waittime = 5
        },
        ["Vehicle Theft"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Attempted Theft ~w~of a ~r~",
                    "pcname",
                    "scname",
                    "vehName",
                    "plate",
                    "~w~ by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Attempted Theft",
                    "street1",
                    "street2"
                }
            },
            Colour = 5,
            BlipTime = 60,
            Outlaw = true,
            OutlawTime = 60,
            Chance = 25,
            Populated = true,
            OwnershipCheck = true,
            Waittime = 5
        },
        ["Weaponized Vehicle"] = {
            Text = {
                ["Citizen"] = {
                    "Reports of a ~r~Weaponized Vehicle~w~, a ~r~",
                    "pcname",
                    "scname",
                    "vehName",
                    "plate",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Weaponized Vehicle",
                    "street1",
                    "street2"
                }
            },
            Colour = 1,
            BlipTime = 60,
            Outlaw = false,
            OutlawTime = 60,
            Chance = 25,
            Populated = true,
            OwnershipCheck = false,
            Waittime = 30
        },
        ["Car Chopping"] = {
            Text = {
                ["Citizen"] = {
                    "Suspected ~r~Car Chopping ~w~of a ~r~",
                    "pcname",
                    "scname",
                    "vehName",
                    "~w~ by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Car Chopping",
                    "street1",
                    "street2"
                }
            },
            Colour = 5,
            BlipTime = 60,
            Outlaw = true,
            OutlawTime = 60,
            Chance = 60,
            Populated = false,
            OwnershipCheck = true,
            Waittime = 5
        },
        ["Drug Deal"] = {
            Text = {
                ["Citizen"] = {
                    "Suspected ~r~Drug Deal ~w~by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Drug Deal",
                    "street1",
                    "street2"
                }
            },
            Colour = 7,
            BlipTime = 60,
            Outlaw = true,
            OutlawTime = 30,
            Chance = 40,
            Populated = true,
            OwnershipCheck = false,
            Waittime = 5
        },
        ["Bank Robbery"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Bank Robbery ~w~by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Bank Robbery",
                    "street1",
                    "street2"
                }
            },
            Colour = 8,
            BlipTime = 300,
            Outlaw = true,
            OutlawTime = 180,
            Chance = 100,
            Populated = false,
            OwnershipCheck = false,
            Waittime = 5
        },
        ["Shop Robbery"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Shop Robbery ~w~by a ~r~",
                    "sex",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Shop Robbery",
                    "street1",
                    "street2"
                }
            },
            Colour = 8,
            BlipTime = 240,
            Outlaw = true,
            OutlawTime = 120,
            Chance = 90,
            Populated = false,
            OwnershipCheck = false,
            Waittime = 5
        },
        ["Explosion"] = {
            Text = {
                ["Citizen"] = {
                    "~r~Explosion ~w~reported~r~",
                    "street1",
                    "street2"
                },
                ["Officer"] = {
                    "~r~Explosion ~w~reported~r~",
                    "street1",
                    "street2"
                }
            },
            Colour = 1,
            BlipTime = 60,
            Outlaw = false,
            OutlawTime = 60,
            Chance = 90,
            Populated = true,
            OwnershipCheck = false,
            Waittime = 1
        }
    },
    Zones = {
        Keys = {
            ['AIRP'] = "Los Santos International Airport", 
            ['ALAMO'] = "Alamo Sea", 
            ['ALTA'] = "Alta", 
            ['ARMYB'] = "Fort Zancudo", 
            ['BANHAMC'] = "Banham Canyon Dr", 
            ['BANNING'] = "Banning", 
            ['BEACH'] = "Vespucci Beach", 
            ['BHAMCA'] = "Banham Canyon", 
            ['BRADP'] = "Braddock Pass", 
            ['BRADT'] = "Braddock Tunnel", 
            ['BURTON'] = "Burton", 
            ['CALAFB'] = "Calafia Bridge", 
            ['CANNY'] = "Raton Canyon", 
            ['CCREAK'] = "Cassidy Creek", 
            ['CHAMH'] = "Chamberlain Hills", 
            ['CHIL'] = "Vinewood Hills", 
            ['CHU'] = "Chumash", 
            ['CMSW'] = "Chiliad Mountain State Wilderness", 
            ['CYPRE'] = "Cypress Flats", 
            ['DAVIS'] = "Davis", 
            ['DELBE'] = "Del Perro Beach", 
            ['DELPE'] = "Del Perro", 
            ['DELSOL'] = "Puerto Del Sol", 
            ['DESRT'] = "Grand Senora Desert", 
            ['DOWNT'] = "Downtown", 
            ['DTVINE'] = "Downtown Vinewood", 
            ['EAST_V'] = "East Vinewood", 
            ['EBURO'] = "El Burro Heights", 
            ['ELGORL'] = "El Gordo Lighthouse", 
            ['ELYSIAN'] = "Elysian Island", 
            ['GALFISH'] = "Galilee", 
            ['GOLF'] = "GWC and Golfing Society", 
            ['GRAPES'] = "Grapeseed", 
            ['GREATC'] = "Great Chaparral", 
            ['HARMO'] = "Harmony", 
            ['HAWICK'] = "Hawick", 
            ['HORS'] = "Vinewood Racetrack", 
            ['HUMLAB'] = "Humane Labs and Research", 
            ['JAIL'] = "Bolingbroke Penitentiary", 
            ['KOREAT'] = "Little Seoul", 
            ['LACT'] = "Land Act Reservoir", 
            ['LAGO'] = "Lago Zancudo", 
            ['LDAM'] = "Land Act Dam", 
            ['LEGSQU'] = "Legion Square", 
            ['LMESA'] = "La Mesa", 
            ['LOSPUER'] = "La Puerta", 
            ['MIRR'] = "Mirror Park", 
            ['MORN'] = "Morningwood", 
            ['MOVIE'] = "Richards Majestic", 
            ['MTCHIL'] = "Mount Chiliad", 
            ['MTGORDO'] = "Mount Gordo", 
            ['MTJOSE'] = "Mount Josiah", 
            ['MURRI'] = "Murrieta Heights", 
            ['NCHU'] = "North Chumash", 
            ['NOOSE'] = "N.O.O.S.E", 
            ['OCEANA'] = "Pacific Ocean", 
            ['PALCOV'] = "Paleto Cove", 
            ['PALETO'] = "Paleto Bay", 
            ['PALFOR'] = "Paleto Forest", 
            ['PALHIGH'] = "Palomino Highlands", 
            ['PALMPOW'] = "Palmer-Taylor Power Station", 
            ['PBLUFF'] = "Pacific Bluffs", 
            ['PBOX'] = "Pillbox Hill", 
            ['PROCOB'] = "Procopio Beach", 
            ['RANCHO'] = "Rancho", 
            ['RGLEN'] = "Richman Glen", 
            ['RICHM'] = "Richman", 
            ['ROCKF'] = "Rockford Hills", 
            ['RTRAK'] = "Redwood Lights Track", 
            ['SANAND'] = "San Andreas", 
            ['SANCHIA'] = "San Chianski Mountain Range", 
            ['SANDY'] = "Sandy Shores", 
            ['SKID'] = "Mission Row", 
            ['SLAB'] = "Slab City", 
            ['STAD'] = "Maze Bank Arena", 
            ['STRAW'] = "Strawberry", 
            ['TATAMO'] = "Tataviam Mountains", 
            ['TERMINA'] = "Terminal", 
            ['TEXTI'] = "Textile City", 
            ['TONGVAH'] = "Tongva Hills", 
            ['TONGVAV'] = "Tongva Valley", 
            ['VCANA'] = "Vespucci Canals", 
            ['VESP'] = "Vespucci", 
            ['VINE'] = "Vinewood", 
            ['WINDF'] = "Ron Alternates Wind Farm", 
            ['WVINE'] = "West Vinewood", 
            ['ZANCUDO'] = "Zancudo River", 
            ['ZP_ORT'] = "Port of South Los Santos", 
            ['ZQ_UAR'] = "Davis Quartz" 
        },
        ["Los Santos International Airport"] = {
            Populated = true,
            Jurisdiction = "police"
        },
        ["Alamo Sea"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Alta"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Fort Zancudo"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Banham Canyon Dr"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Banning"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Vespucci Beach"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Banham Canyon"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Braddock Pass"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Braddock Tunnel"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Burton"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Calafia Bridge"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Raton Canyon"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Cassidy Creek"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Chamberlain Hills"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Vinewood Hills"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Chumash"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Chiliad Mountain State Wilderness"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Cypress Flats"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Davis"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Del Perro Beach"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Del Perro"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Puerto Del Sol"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Grand Senora Desert"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Downtown"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Downtown Vinewood"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["East Vinewood"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["El Burro Heights"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["El Gordo Lighthouse"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Elysian Island"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Galilee"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["GWC and Golfing Society"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Grapeseed"] = {
            Name = "Grapeseed",
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Great Chaparral"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Harmony"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Hawick"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Vinewood Racetrack"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Humane Labs and Research"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Bolingbroke Penitentiary"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Little Seoul"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Land Act Reservoir"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Lago Zancudo"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Land Act Dam"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Legion Square"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["La Mesa"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["La Puerta"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Mirror Park"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Morningwood"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Richards Majestic"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Mount Chiliad"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Mount Gordo"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Mount Josiah"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Murrieta Heights"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["North Chumash"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["N.O.O.S.E"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Pacific Ocean"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Paleto Cove"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Paleto Bay"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Paleto Forest"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Palomino Highlands"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Palmer-Taylor Power Station"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Pacific Bluffs"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Pillbox Hill"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Procopio Beach"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Rancho"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Richman Glen"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Richman"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Rockford Hills"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Redwood Lights Track"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["San Andreas"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["San Chianski Mountain Range"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Sandy Shores"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Mission Row"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Slab City"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }, 
        ["Maze Bank Arena"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Strawberry"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Tataviam Mountains"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Terminal"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Textile City"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Tongva Hills"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Tongva Valley"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Vespucci Canals"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Vespucci"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Vinewood"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Ron Alternates Wind Farm"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["West Vinewood"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Zancudo River"] = {
            Populated = false,
            Jurisdiction = "sheriff"
        }, 
        ["Port of South Los Santos"] = {
            Populated = true,
            Jurisdiction = "police"
        }, 
        ["Davis Quartz"] = {
            Populated = true,
            Jurisdiction = "sheriff"
        }
    }
}

-- Settings
Config.StealOwnChance = 10 -- Chance to trigger an alert for trying to steal your own car, compounds with other probabilities
Config.AudioAlerts = true -- Set to false to disable audio alerts, they won't work anyway without the correct version of interactsound
Config.UseItems = true -- Set to false if you don't want the scanner item functionality

-- Extra Details
Config.vehName = 50
Config.Colours = 75
Config.Plate = 10