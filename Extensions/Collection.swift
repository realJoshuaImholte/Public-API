//This eliminates the risk of IndexOutOfRange Error for UITableView Population. We can't catch en error type when looping through the UITableView
extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
