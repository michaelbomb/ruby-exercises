def bubble_sort(arr)
    res = arr[0...arr.length]
    res.length.times do
        i = 0
        while i + 1 < res.length
            if res[i] > res[i+1]
                res[i], res[i+1] = res[i+1], res[i]
            end
            i += 1
        end
    end
    return res
end

def bubble_sort_by(arr)
    res = arr[0...arr.length]
    res.length.times do
        i = 0
        while i + 1 < res.length
            if yield(res[i],res[i+1]) > 0
                res[i], res[i+1] = res[i+1], res[i]
            end
            i += 1
        end
    end
    return res
end

