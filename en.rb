module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield self[i]
            i += 1
        end
        return self
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(i, self[i])
            i += 1
        end
    end

    def my_select
        res = []
        self.my_each {|el| res.push(el) if yield(el)}
        return res
    end

    def my_all?
        self.my_each {|el| return false unless yield(el)}
        return true
    end

    def my_any?
        self.my_each {|el| return true if yield(el)}
        return false
    end

    def my_none?
        self.my_each {|el| return false if yield(el)}
        return false
    end

    def my_count
        res = 0
        self.my_each {|el| res += 1 if yield(el)}
    end

    def my_map(&proc)
        res = []
        self.my_each do |el|
            if !proc.nil? 
                res.push proc.call(el)
            else
                res.push yield(el)
            end
        end
        return res
    end

    def my_inject(res = self[0])
        self.my_each {|x| res = yield(res, x)}
        return res
    end

  end