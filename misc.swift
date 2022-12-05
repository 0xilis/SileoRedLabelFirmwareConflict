//by Snoolie / 0xilis, licensed under MIT

#if os(iOS)
                
                let deponfw = "Depends: " + (targetPackage.depends ?? "boobs") + ","
                if deponfw.contains("firmware") {
                    if doesNotDepend(confOrDependString: deponfw, forVersion: Float(UIDevice.current.systemVersion)!) {
                        titleLabel?.textColor = UIColor.red
                        targetPackage.isFirmwareConflict = true
                    } else {
                        let conflictwithfw = (targetPackage.conflicts ?? "cock") + ","
                        if conflictwithfw.contains("firmware") {
                            if !doesNotDepend(confOrDependString: conflictwithfw, forVersion: Float(UIDevice.current.systemVersion)!) {
                                titleLabel?.textColor = UIColor.red
                                targetPackage.isFirmwareConflict = true
                            } else {
                                let preDepends = "Pre-Depends: " + (targetPackage.preDepends ?? "boobies") + ","
                                if preDepends.contains("firmware") {
                                    if doesNotDepend(confOrDependString: preDepends, forVersion: Float(UIDevice.current.systemVersion)!) {
                                        titleLabel?.textColor = UIColor.red
                                        targetPackage.isFirmwareConflict = true
                                    } else {
                                        let breaks = "Breaks: " + (targetPackage.conflicts ?? "cock") + ","
                                        if breaks.contains("firmware") {
                                            if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                                titleLabel?.textColor = UIColor.red
                                                targetPackage.isFirmwareConflict = true
                                            }
                                        }
                                    }
                                } else {
                                    let breaks = "Breaks: " + (targetPackage.breaks ?? "cock") + ","
                                    if breaks.contains("firmware") {
                                        if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                            titleLabel?.textColor = UIColor.red
                                            targetPackage.isFirmwareConflict = true
                                        }
                                    }
                                }
                            }
                        } else {
                            let preDepends = "Pre-Depends: " + (targetPackage.preDepends ?? "boobies") + ","
                            if preDepends.contains("firmware") {
                                if doesNotDepend(confOrDependString: preDepends, forVersion: Float(UIDevice.current.systemVersion)!) {
                                    titleLabel?.textColor = UIColor.red
                                    targetPackage.isFirmwareConflict = true
                                } else {
                                    let breaks = "Breaks: " + (targetPackage.conflicts ?? "cock") + ","
                                    if breaks.contains("firmware") {
                                        if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                            titleLabel?.textColor = UIColor.red
                                            targetPackage.isFirmwareConflict = true
                                        }
                                    }
                                }
                            } else {
                                let breaks = "Breaks: " + (targetPackage.breaks ?? "cock") + ","
                                if breaks.contains("firmware") {
                                    if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                        titleLabel?.textColor = UIColor.red
                                        targetPackage.isFirmwareConflict = true
                                    }
                                }
                            }
                        }
                    }
                } else {
                    let conflictwithfw = "Conflicts: " + (targetPackage.conflicts ?? "cock") + ","
                    if conflictwithfw.contains("firmware") {
                        if !doesNotDepend(confOrDependString: conflictwithfw, forVersion: Float(UIDevice.current.systemVersion)!) {
                            titleLabel?.textColor = UIColor.red
                            targetPackage.isFirmwareConflict = true
                        } else {
                            let preDepends = "Pre-Depends: " + (targetPackage.preDepends ?? "boobies") + ","
                            if preDepends.contains("firmware") {
                                if doesNotDepend(confOrDependString: preDepends, forVersion: Float(UIDevice.current.systemVersion)!) {
                                    titleLabel?.textColor = UIColor.red
                                    targetPackage.isFirmwareConflict = true
                                } else {
                                    let breaks = "Breaks: " + (targetPackage.conflicts ?? "cock") + ","
                                    if breaks.contains("firmware") {
                                        if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                            titleLabel?.textColor = UIColor.red
                                            targetPackage.isFirmwareConflict = true
                                        }
                                    }
                                }
                            } else {
                                let breaks = "Breaks: " + (targetPackage.breaks ?? "cock") + ","
                                if breaks.contains("firmware") {
                                    if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                        titleLabel?.textColor = UIColor.red
                                        targetPackage.isFirmwareConflict = true
                                    }
                                }
                            }
                        }
                    } else {
                        let preDepends = "Pre-Depends: " + (targetPackage.preDepends ?? "boobies") + ","
                        if preDepends.contains("firmware") {
                            if doesNotDepend(confOrDependString: preDepends, forVersion: Float(UIDevice.current.systemVersion)!) {
                                titleLabel?.textColor = UIColor.red
                                targetPackage.isFirmwareConflict = true
                            } else {
                                let breaks = "Breaks: " + (targetPackage.conflicts ?? "cock") + ","
                                if breaks.contains("firmware") {
                                    if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                        titleLabel?.textColor = UIColor.red
                                        targetPackage.isFirmwareConflict = true
                                    }
                                }
                            }
                        } else {
                            let breaks = "Breaks: " + (targetPackage.breaks ?? "cock") + ","
                            if breaks.contains("firmware") {
                                if !doesNotDepend(confOrDependString: breaks, forVersion: Float(UIDevice.current.systemVersion)!) {
                                    titleLabel?.textColor = UIColor.red
                                    targetPackage.isFirmwareConflict = true
                                }
                            }
                        }
                    }
                }

                #endif

//Thanks to Serena for original function, this is changed by me (Snoolie/0xilis) from the original to fix some bugs and make it slightly faster.
    //This function is licensed under MIT at https://github.com/0xilis/SileoRedLabelFirmwareConflict
    //It take in a Depends (or Pre-Depends) and will return true if the firmware is in regards
    private func doesNotDepend(confOrDependString: String, forVersion ver: Float) -> Bool {
        let noSpaceFull = confOrDependString.replacingOccurrences(of: " ", with: "");
        var noSpaceIter = 0
        for noSpacet in noSpaceFull.components(separatedBy: ",firmware")  { //support for two firmware depends in one field
            var noSpace = ""
            if noSpaceIter == 0 {
                if !noSpaceFull.contains(":firmware") { //handle if :firmware
                    noSpaceIter += 1
                    continue;
                } else {
                    noSpace = noSpacet
                }
            } else {
                noSpace = "firmware" + noSpacet
            }
            guard let startIndex = noSpace.range(of: "firmware")?.upperBound, let endIndex = noSpace.range(of: ",", options: .init(rawValue: 0), range: startIndex..<noSpace.endIndex, locale: nil)?.lowerBound else {
                noSpaceIter += 1
                continue
            }
            let baseString = String(noSpace[startIndex..<endIndex]).replacingOccurrences(of: ")", with: "") //we shouldn't need to remove (, only )
            if baseString.contains("|") {
                //something other than firmware
                noSpaceIter += 1
                continue //we don't actually want to mark as red if something other than the firmware conflicts, so firmware (>= 13.0) | somedeb gets marked as false even if firmware is lower than 13.0, since somedeb isn't firmware
            }
            var operatorType = 0
            //operatorTypes:
            //> / >> are 1
            //< / << are 2
            //= is 3
            //>= is 4
            //<= is 5
            var iterator = 0
            var versionParsed = Float(-1)
            for i in baseString {
                if i.isWholeNumber {
                    versionParsed = Float(baseString.dropFirst(iterator)) ?? Float(-1)
                    break; //we found the char
                } else if i == ">" {
                    operatorType = 1
                } else if i == "<" {
                    operatorType = 2
                } else if i == "=" {
                    operatorType += 3
                }
                iterator += 1
            }
            if versionParsed == -1 {
                print("COULD NOT FIND VERSIONPARSED")
                noSpaceIter += 1
                continue
            }
            noSpaceIter += 1
            switch operatorType {
                case 1: if (versionParsed >= ver) {return versionParsed >= ver}
                case 2: if (versionParsed <= ver) {return versionParsed <= ver}
                case 4: if (versionParsed > ver) {return versionParsed > ver}
                case 5: if (versionParsed < ver) {return versionParsed < ver}
                case 3: if (versionParsed != ver) {return versionParsed != ver}
                default: continue;
            }
        }
        return false
    }
