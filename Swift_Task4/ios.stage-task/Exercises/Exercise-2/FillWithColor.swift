import Foundation

final class FillWithColor {
     
    static func evalNeighbours(_ row:Int, _ column:Int, _ rowsCount:Int, _ columnsCount:Int) -> [(Int,Int)] {
        var result:[(Int, Int)] = []
        for (r,c) in [(row, column - 1), (row, column + 1), (row - 1, column), (row + 1, column)] {
                if (r >= 0  && c >= 0 && r < rowsCount && c < columnsCount) {
                    result.append((r, c))
                }
        }
        return result
    }
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        let allRows = image.count
        let allColumns = image[0].count

        if (image.first == nil || row < 0 || row >= allRows || column < 0 || column >= allColumns) {
            return image
        }
        
        var visit: [[Bool]] = [[]]
        var newImage = image
        let oldColor = image[row][column]

        visit = Array(repeating: Array(repeating: false, count: allColumns), count: allRows)
        visit[row][column] = true
        var peak = [(row, column)]
        newImage[row][column] = newColor
        while peak.count > 0 {
            let (row, column) = peak[peak.count - 1]
            peak.remove(at:peak.count - 1)
            let neighbours = FillWithColor.evalNeighbours(row, column, allRows, allColumns)
            for (r,c) in neighbours {
                if !visit[r][c] && image[r][c] == oldColor {
                    visit[r][c] = true
                    newImage[r][c] = newColor
                    peak.append((r,c))
                }
            }
        }
        return newImage
    }
    
}
