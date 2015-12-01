def bubble_sort(list)
    return list if list.size <= 1
    sorted = false
    until sorted
        sorted = true
         0.upto(list.size-2) do |i|
            if list[i] > list[i+1] 
                list[i], list[i+1] = list[i+1], list[i]
                sorted = false
            end
        end
    end
    return list
end

def bubble_sort_by(list)
    return list if list.size <= 1
    sorted = false
    until sorted
        sorted = true
         0.upto(list.size-2) do |i|
            if yield(list[i], list[i+i]) > 0
                list[i], list[i+1] = list[i+1], list[i]
                sorted = false
            end
        end
    end
    return list
end

bubble_sort([5,2,8,0,3])
bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length }