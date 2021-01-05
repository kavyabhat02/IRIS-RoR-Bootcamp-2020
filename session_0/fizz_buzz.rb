def fizz_buzz(n:, x:3, y:5)
   if(n<0)||(x<=0)||(y<=0)
     raise ArgumentError, "Invalid input"
   end
   
   array = [*1..n]
   array.map{ |k|
     if(k%x == 0) &&(k%y==0)
       k = "FizzBuzz"
     elsif(k%x == 0)
       k = "Fizz"
     elsif(k%y == 0)
       k = "Buzz"
     else
       k = k.to_s
     end
   }
end


