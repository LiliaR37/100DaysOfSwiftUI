import UIKit

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]



let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

/*
 let captainFirstTeam = team.sorted {
     if $0 == "Suzanne" {
         return true
     } else if $1 == "Suzanne" {
         return false
     }

     return $0 < $1
 }
 */

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
