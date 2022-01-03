function [child1,child2] = CrossOverFunction(parent1,parent2,LowerLimit, UpperLimit)
format bank

child1(1,1) = (parent1(1,1)+parent1(1,2))/2;
child1(1,2) = (parent1(1,1)+parent2(1,1))/1.5;
child2(1,1) = (parent2(1,1)+parent2(1,1))/1.5;
child2(1,2) = (parent2(1,2)+parent2(1,2))/1.5;


% if Childern goes out of asnwer range 
if child1(1,1) < LowerLimit
    child1(1,1)  = LowerLimit;
end   
if child1(1,2) < LowerLimit
    child1(1,2)  = LowerLimit;
end  

if child2(1,1) < LowerLimit
    child2(1,1)  = LowerLimit;
end   
if child2(1,2) < LowerLimit
    child2(1,2)  = LowerLimit;
end

if child1(1,1) > UpperLimit
    child1(1,1)  = UpperLimit;
end   
if child1(1,2) > UpperLimit
    child1(1,2)  = UpperLimit;
end  

if child2(1,1) > UpperLimit
    child2(1,1)  = UpperLimit;
end   
if child2(1,2) > UpperLimit
    child2(1,2)  = UpperLimit;
end

% binParent11 =  dec2bin((parent1(1,1)),6);
% binParent12 =  dec2bin((parent1(1,2)),6);
% 
% binParent21 =  dec2bin((parent2(1,1)),6);
% binParent22 =  dec2bin((parent2(1,2)),6);
% 
%  h = randi([1,6],1,1);
% tempchild1  = [binParent11(1:h) binParent22(h:numel(binParent22))];
% tempchild2  = [binParent22(1:h)  binParent11(h:numel(binParent11))];
% 
% child1(1,1) = (bin2dec(num2str(tempchild1)));
% child1(1,2) = (bin2dec(num2str(tempchild2)));
% 
% 
% 
% tempchild1  = [binParent12(1:h) binParent21(h:numel(binParent21))];
% tempchild2  = [binParent21(1:h) binParent12(h:numel(binParent12))];
% 
% child2(1,1) = (bin2dec(num2str(tempchild1)));
% child2(1,2) = (bin2dec(num2str(tempchild2)));
% 
 child1
 child2;




end

