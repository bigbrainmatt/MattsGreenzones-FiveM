Config = {}

-- Would you like to have a marker in the custom green zone? This is to show the player where the center of the greenzone is.
Config.Marker = true
-- The type of marker that is shown to the player when they are in a green zone. https://docs.fivem.net/docs/game-references/markers/
Config.MarkerType = 1

-- The color of the marker that is shown to the player when they are in a green zone. This is the color of the marker that is shown to the player when they are in a green zone.
Config.MarkerColor = {
    r = 0, 
    g = 255, 
    b = 0,
    a = 155
}

-- Defualt radius of custom green zone. This is the radius of the green zone in meters.
Config.SpawnRadius = 10

-- The height of the green zone. This is the height of the green zone in meters.
Config.GreenZoneHight = 100

-- Disable / Enable the text to notfiy into the player when they are in a green zone.
Config.ShowText = true

-- The text that is shown to the player when they are in a green zone.
Config.GreenzoneText = "You are in a green zone!"

-- If you want to modify the text look at this Native https://docs.fivem.net/natives/?_0x07C837F9A01C34C9 and mess with it
-- Set the Sclae of the text. This is the scale of the text that is shown to the player when they are in a green zone.
Config.TextScale = 0.0

-- Set the size of the text. This is the size of the text that is shown to the player when they are in a green zone.
Config.TextSize = 0.5

-- Set text color. RGB values. This is the color of the text that is shown to the player when they are in a green zone.
Config.TextColor = {
    r = 255, 
    g = 0, 
    b = 0,
    a = 255
}

-- The cordsinates of the green zones. These are the coordinates of the green zones in the game.
Config.Coords = {
    PBPD = {
        vector3(-450.3412, 5984.8853, 31.3871),
        vector3(-472.0488, 5963.1733, 31.3506),
        vector3(-500.6456, 5991.8286, 31.3351),
        vector3(-478.5709, 6014.6445, 31.3405),
        vector3(-488.3345, 6024.4229, 31.3405),
        vector3(-460.9107, 6051.8452, 31.3405),
        vector3(-444.8992, 6060.6299, 31.4697),
        vector3(-428.6086, 6024.9766, 31.4773),
        vector3(-420.9552, 6001.2148, 31.4901),
        vector3(-432.9415, 5988.1416, 31.4901),
        vector3(-429.4265, 5984.7251, 31.4901),
        vector3(-439.2054, 5975.3213, 31.4902)
    },
    PBH = {
        vector3(-258.13, 6295.87, 31.49),
        vector3(-287.64, 6324.09, 32.63),
        vector3(-256.55, 6354.74, 32.62),
        vector3(-227.81, 6326.43, 31.61)
    },

    PBFS = {
        vector3(-362.25, 6152.78, 32.26),
        vector3(-328.92, 6119.39, 32.14),
        vector3(-373.88, 6074.42, 31.44),
        vector3(-380.65, 6083.61, 31.44),
        vector3(-387.40, 6095.30, 31.44),
        vector3(-392.22, 6103.65, 31.44),
        vector3(-405.98, 6117.11, 31.34),
        vector3(-392.11, 6130.79, 31.37),
        vector3(-388.81, 6132.96, 31.60),
        vector3(-369.35, 6146.61, 31.40)
    },

    SSPDandH = {
        vector3(1816.13, 3657.99, 34.21),
        vector3(1801.44, 3683.34, 34.22),
        vector3(1856.53, 3714.20, 33.27),
        vector3(1871.88, 3690.28, 33.62)
    },

    VWPD = {
        vector3(666.70, 2.11, 84.19),
        vector3(657.43, 7.21, 85.14),
        vector3(649.11, 10.71, 85.65),
        vector3(624.71, 19.67, 87.97),
        vector3(609.84, 25.10, 89.66),
        vector3(594.79, 28.63, 91.05),
        vector3(581.12, 31.36, 92.34),
        vector3(568.98, 32.78, 93.40),
        vector3(560.24, 33.13, 94.12),
        vector3(551.59, 32.63, 94.29),
        vector3(538.27, 29.77, 94.14),
        vector3(529.17, 26.55, 93.60),
        vector3(521.61, 22.59, 92.55),
        vector3(515.74, 18.03, 91.65),
        vector3(509.17, 12.11, 90.26),
        vector3(504.06, 6.33, 88.96),
        vector3(499.91, 1.38, 87.70),
        vector3(496.17, -4.82, 86.39),
        vector3(491.21, -13.07, 84.43),
        vector3(506.29, -22.34, 80.74),
        vector3(517.39, -28.73, 78.11),
        vector3(526.95, -36.31, 73.27),
        vector3(532.67, -44.60, 73.01),
        vector3(537.80, -52.74, 73.11),
        vector3(542.24, -57.98, 73.15),
        vector3(547.99, -62.92, 73.19),
        vector3(557.92, -67.03, 73.84),
        vector3(571.79, -62.15, 72.06),
        vector3(591.97, -54.81, 74.22),
        vector3(600.75, -50.95, 75.25),
        vector3(608.78, -47.27, 76.23),
        vector3(617.16, -43.25, 77.23),
        vector3(625.18, -38.80, 78.29),
        vector3(633.52, -33.18, 79.51),
        vector3(638.37, -29.77, 80.14),
        vector3(641.49, -27.37, 80.63),
        vector3(645.55, -23.81, 81.35),
        vector3(650.58, -18.96, 82.22),
        vector3(657.82, -10.91, 83.60),
        vector3(661.53, -6.11, 84.04),
        vector3(665.98, 0.36, 84.15)
    },

    MRPD = {
        vector3(419.23, -1031.95, 29.13),
        vector3(417.60, -1000.10, 29.26),
        vector3(416.44, -985.21, 29.43),
        vector3(415.34, -966.65, 29.47),
        vector3(425.48, -964.41, 29.33),
        vector3(449.71, -964.01, 28.69),
        vector3(472.85, -963.71, 27.80),
        vector3(487.18, -964.31, 27.40),
        vector3(491.44, -966.83, 27.37),
        vector3(492.11, -983.44, 27.58),
        vector3(491.45, -1025.67, 28.15)
    }

    -- To add more green zones, just copy the above format and change the name and coordinates.

}