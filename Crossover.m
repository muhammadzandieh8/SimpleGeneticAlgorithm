function [child1,child2] = Crossover( parent1,parent2,LowerLimit, UpperLimit )
%Crossover Summary of this function goes here
%   Detailed explanation goes here

%  child = parent2;
%  h=round(numel(child));
%  child(1:h)=parent1(1:h); 

 [child1,child2] = CrossOverFunction(parent1,parent2,LowerLimit, UpperLimit);

end

