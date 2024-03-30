function [ output_age ] = age( input_age )
 if       ((input_age>=1)  &&  (input_age<=12))
    
     %-------------------(1-8)----------------------------
     if ((input_age>=1)  &&  (input_age<=8))
        output_age='The age range is between:1-8';
     %-------------------(9-12)----------------------------
     elseif ((input_age>=9)  &&  (input_age<=12))
         output_age='The age range is between:9-12';
     end
  %---------------------Range : 13-25  ---------------------------
  elseif ((input_age>=13) && (input_age<=25))
    
     %-------------------(13-19)----------------------------
     if ((input_age>=13)  &&  (input_age<=19))
         output_age='The age range is between:13-19';
     %-------------------(20-25)----------------------------
     elseif ((input_age>=20)  &&  (input_age<=25))
         output_age='The age range is between:20-25';
     end
  %---------------------Range : 26-45  ---------------------------
  elseif ((input_age>=26) && (input_age<=45))
   
     %-------------------(26-35)----------------------------
     if ((input_age>=26)  &&  (input_age<=35))
         output_age='The age range is between:26-35';
     %-------------------(36-45)----------------------------
     elseif ((input_age>=36)  &&  (input_age<=45))
         output_age='The age range is between:36-45';
     end
  %---------------------Range : 46-63  ---------------------------
  elseif ((input_age>=46) && (input_age<=63))
     
     %-------------------(46-53)----------------------------
     if ((input_age>=46)  &&  (input_age<=53))
        output_age='The age range is between:46-53';
     %-------------------(54-63)----------------------------
     elseif ((input_age>=54)  &&  (input_age<=63))
         output_age='The age range is between:54-63';
     end
  end
 

end

