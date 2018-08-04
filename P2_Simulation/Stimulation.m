 clear all; close all;
% 
n = 10000;
wins1 = 0; 
wins2 = 0;
wins3 = 0;


%  A = 5*ceil(ceil(100-rand(1)*50)/5);

for j=1:n
    high = 0;
    sum = 0;sum2= 0; sum3 = 0;

    %% player 1
     r1 = 5*randi([1,20]);
     sum = r1;
     
     if r1 >= 100
         high = r1;
         
     else
         r2 = 5*randi([1,20]);
         sum = r1 + r2;
         if sum <= 100
             high = sum;
         else 
            sum = 0;
            high = 0;
         end
         
     end % end Player 1
     
      P1point = sum;
      space(j,1) = sum;
      %% PLAYER 2 
     
     r3 = 5*randi([1,20]);
     sum2 = r3;
     if r3 > high 
         if r3 <= 55
            r4 = 5*randi([1,20]);
            sum2 = r3 + r4;
            if sum2 <= 100
                high = sum2;
            else 
                sum2 = 0;
            end
         elseif r3 > 55
             high = r3;
         end
        
     elseif r3 < high
            r4 = 5*randi([1,20]);
            sum2 = r3 + r4;
            if sum2 <= 100
                high = max(high,sum2);
            elseif sum2 > 100 
                sum2 = 0;
            end
     elseif r3 == high
         if r3 >= 65
            high = sum2;
         else 
            r4 = 5*randi([1,20]);
            sum2 = r3 + r4;  
            if sum2 <= 100
                high = sum2;
            else 
                sum2 = 0;
            end
         end
         
     end  %% end player 2
     space(j,2) = sum2;
     P2point = sum2;
     
     %% Player 3
     r5 = 5*randi([1,20]);
     sum3 = r5;
     if r5 > high 
         high = r5;
     elseif r5 == high
         if r5 == sum && r5 == sum2
              if r5 <= 65
                  r6 = 5*randi([1,20]);
                  sum3 = r5 + r6;
                  if sum3 > 100
                    sum3 = 0;
                  elseif high < sum3 
                     high = sum3;
                  end
              end
         elseif r5 == sum || r5 == sum2
              if  r5 <= 50
                  r6 = 5*randi([1,20]);
                  sum3 = r5 + r6;
                  if sum3 > 100
                      sum3 = 0;
                  elseif high < sum3
                      high = sum3;
                  end
              end
          end
     elseif r5 < high 
         r6 = 5*randi([1,20]);
         sum3 = r5 + r6;
         if sum3 > 100
             sum3 = 0;
         elseif sum3 >= high
             high = sum3;
         end
     end
space(j,3) = sum3;     
     %% high ct 
     if high == sum && high == sum2 && high == sum3
          wins = randi([1,3]);
          if wins == 1
             wins1 = wins1 +1;
          elseif wins == 2
             wins2 = wins2 +1;
          else
              wins3 = wins3+1;
          end 
     elseif high == sum && high == sum2
         wins = randi([1,2]);
         if wins == 1
             wins1 = wins1 +1;
         else 
             wins2 = wins2 +1;
         end
         
     elseif high == sum && high == sum3
         wins = randi([1,2]);
         if wins == 1
             wins1 = wins1 +1;
         else 
             wins3 = wins3 +1;
         end
         
     elseif high == sum2 && high == sum3
         wins = randi([1,2]);
         if wins == 1
             wins2 = wins2 +1;
         else 
             wins3 = wins3 +1;
         end   
         
     elseif high == sum
         wins1 = wins1 +1;
     elseif high == sum2
         wins2 = wins2 +1;
     elseif high == sum3
         wins3 = wins3+1;
     end
     

end

p1win = wins1/n*100;
p2win = wins2/n*100;
p3win = wins3/n*100;

space = [p1win p2win p3win]

sprintf('%.2f%% ', wins1/n*100)
sprintf('%.2f%%', wins2/n*100)
sprintf('%.2f%%', p3win)



% P1win(n,1) = (wins1/n)*100 ;


