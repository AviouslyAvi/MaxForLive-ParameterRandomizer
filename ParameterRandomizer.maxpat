{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      120,
      120,
      560,
      420
    ],
    "openinpresentation": 1,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 0,
    "gridsize": [
      15,
      15
    ],
    "gridsnaponopen": 0,
    "toolbarvisible": 1,
    "boxes": [
      {
        "box": {
          "id": "obj-201",
          "maxclass": "panel",
          "patching_rect": [
            380,
            20,
            240,
            180
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            240,
            180
          ],
          "bgcolor": [
            0.1,
            0.1,
            0.11,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-202",
          "maxclass": "panel",
          "patching_rect": [
            380,
            20,
            240,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            240,
            24
          ],
          "bgcolor": [
            0.17,
            0.17,
            0.18,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-203",
          "maxclass": "comment",
          "text": "Parameter Randomizer",
          "patching_rect": [
            388,
            23,
            170,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            3,
            170,
            18
          ],
          "textcolor": [
            0.9,
            0.9,
            0.92,
            1
          ],
          "fontsize": 12,
          "fontface": 1,
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "obj-204",
          "maxclass": "panel",
          "patching_rect": [
            392,
            62,
            226,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            8,
            56,
            224,
            1
          ],
          "bgcolor": [
            0.25,
            0.25,
            0.27,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-205",
          "maxclass": "panel",
          "patching_rect": [
            392,
            118,
            226,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            8,
            112,
            224,
            1
          ],
          "bgcolor": [
            0.25,
            0.25,
            0.27,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-206",
          "maxclass": "comment",
          "text": "Map target, then randomize or run Auto.",
          "patching_rect": [
            388,
            180,
            220,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            160,
            220,
            16
          ],
          "textcolor": [
            0.65,
            0.65,
            0.68,
            1
          ],
          "fontsize": 9,
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "text": "js m4l_param_randomizer.js",
          "patching_rect": [
            30,
            330,
            170,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "message",
          "text": "Map",
          "patching_rect": [
            30,
            80,
            92,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            30,
            68,
            22
          ],
          "bgcolor": [
            0.14,
            0.14,
            0.15,
            1
          ],
          "textcolor": [
            0.9,
            0.9,
            0.92,
            1
          ],
          "bordercolor": [
            0.95,
            0.47,
            0.67,
            1
          ],
          "fontsize": 10.5
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "message",
          "text": "Rand",
          "patching_rect": [
            140,
            80,
            74,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            82,
            30,
            68,
            22
          ],
          "bgcolor": [
            0.14,
            0.14,
            0.15,
            1
          ],
          "textcolor": [
            0.9,
            0.9,
            0.92,
            1
          ],
          "bordercolor": [
            0.95,
            0.47,
            0.67,
            1
          ],
          "fontsize": 10.5
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "live.toggle",
          "patching_rect": [
            30,
            165,
            24,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            190,
            76,
            24,
            24
          ],
          "bordercolor": [
            0.25,
            0.25,
            0.27,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_enum": [
                "off",
                "on"
              ],
              "parameter_longname": "Auto",
              "parameter_mmax": 1,
              "parameter_shortname": "Auto",
              "parameter_type": 2
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "live.numbox",
          "patching_rect": [
            95,
            166,
            60,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            136,
            62,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Interval",
              "parameter_shortname": "Interval",
              "parameter_type": 0,
              "parameter_mmin": 10,
              "parameter_mmax": 10000,
              "parameter_unitstyle": 2
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "text": "metro 750",
          "patching_rect": [
            30,
            205,
            63,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "live.dial",
          "patching_rect": [
            30,
            275,
            44,
            48
          ],
          "minimum": 0,
          "maximum": 1,
          "presentation": 1,
          "presentation_rect": [
            10,
            80,
            44,
            48
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Amount",
              "parameter_shortname": "Amount",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_unitstyle": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "text": "prepend set_amount",
          "patching_rect": [
            105,
            275,
            126,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "message",
          "text": "Ready",
          "patching_rect": [
            260,
            80,
            390,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            84,
            136,
            146,
            22
          ],
          "bgcolor": [
            0.14,
            0.14,
            0.15,
            1
          ],
          "textcolor": [
            0.42,
            0.85,
            1,
            1
          ],
          "bordercolor": [
            0.25,
            0.25,
            0.27,
            1
          ],
          "fontsize": 9.5
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [
            260,
            330,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "live.numbox",
          "patching_rect": [
            260,
            165,
            90,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            84,
            80,
            62,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "LastVal",
              "parameter_shortname": "LastVal",
              "parameter_type": 0,
              "parameter_mmin": -99999,
              "parameter_mmax": 99999,
              "parameter_unitstyle": 1
            }
          },
          "active": 0
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "comment",
          "text": "Parameter Randomizer (Max for Live patch)",
          "patching_rect": [
            30,
            20,
            310,
            20
          ],
          "fontsize": 10
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "comment",
          "text": "1) Click a parameter in Ableton  2) Click map_selected  3) Click randomize",
          "patching_rect": [
            30,
            45,
            480,
            20
          ],
          "fontsize": 10
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "comment",
          "text": "Auto",
          "patching_rect": [
            30,
            145,
            35,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            158,
            64,
            28,
            16
          ],
          "fontsize": 10,
          "textcolor": [
            0.65,
            0.65,
            0.68,
            1
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "comment",
          "text": "Interval ms",
          "patching_rect": [
            95,
            145,
            80,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            120,
            70,
            16
          ],
          "fontsize": 10,
          "textcolor": [
            0.65,
            0.65,
            0.68,
            1
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "comment",
          "text": "Amount (0-1)",
          "patching_rect": [
            30,
            248,
            250,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            64,
            62,
            16
          ],
          "fontsize": 10,
          "textcolor": [
            0.65,
            0.65,
            0.68,
            1
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "comment",
          "text": "Last",
          "patching_rect": [
            260,
            145,
            90,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            84,
            64,
            42,
            16
          ],
          "fontsize": 10,
          "textcolor": [
            0.65,
            0.65,
            0.68,
            1
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "message",
          "text": "Clear",
          "patching_rect": [
            230,
            80,
            61,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            154,
            30,
            76,
            22
          ],
          "bgcolor": [
            0.14,
            0.14,
            0.15,
            1
          ],
          "textcolor": [
            0.9,
            0.9,
            0.92,
            1
          ],
          "bordercolor": [
            0.95,
            0.47,
            0.67,
            1
          ],
          "fontsize": 10.5
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "loadmess",
          "text": "750",
          "patching_rect": [
            170,
            166,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "loadmess",
          "text": "1.",
          "patching_rect": [
            30,
            305,
            35,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-7",
            0
          ],
          "destination": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            0
          ],
          "destination": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-10",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            1
          ],
          "destination": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-7",
            0
          ]
        }
      }
    ]
  }
}