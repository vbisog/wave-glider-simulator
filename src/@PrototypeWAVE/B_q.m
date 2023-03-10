function B = B_q(model, q)
%B_Q Evaluates the inertia matrix B(q) for the WAVE prototype.
%
%    B = B_Q(MODEL, Q)
%       returns the value of the inertia matrix B(q) evaluated on the basis
%       of the prototype dynamics parameters for a particular value of the
%       joint variables Q.
%
%    This function was generated by the Symbolic Math Toolbox version 5.4.
%    27-Feb-2012 21:39:53

% Centers Of Gravity (COG)
pm1 = model.cog.vehicle;
pm2 = model.cog.link;
pm3 = model.cog.wing - model.mounting.wing;

% Joint positions
a1 = model.joint.vehicle;
a2 = model.joint.link;

% Masses
m1 = model.mass.vehicle;
m2 = model.mass.link;
m3 = model.mass.wing;

% Moments of inertia (about the local z-axis of each body in the
% Denavit-Hartemberg modeling of the prototype).
I1_zz = model.inertia.vehicle;
I2_zz = model.inertia.link;
I3_zz = model.inertia.wing;

% Added masses
Ma1_u  = model.added_mass.vehicle(1,1);
Ma1_w  = model.added_mass.vehicle(2,2);
Ma1_wq = model.added_mass.vehicle(2,3);
Ma1_qw = model.added_mass.vehicle(3,2);
Ma1_q  = model.added_mass.vehicle(3,3);
Ma2_u = model.added_mass.link(1,1);
Ma2_w = model.added_mass.link(2,2);
Ma2_q = model.added_mass.link(3,3);
Ma3_u = model.added_mass.wing(1,1);
Ma3_w = model.added_mass.wing(2,2);
Ma3_q = model.added_mass.wing(3,3);

% Joint variables 
q3 = q(3,:);        % Vehicle pitch           [rad]
q4 = -pi+q(4,:);    % Hull-to-arm joint angle [rad]
q5 = q(5,:);        % Arm-to-wing joint angle [rad]

t2 = q3+q4;
t3 = sin(t2);
t4 = sin(q3);
t5 = q3+q4+q5;
t6 = sin(t5);
t7 = a2.*t3;
t8 = pm3.*t6;
t9 = a2.*t3.*(1.0./2.0);
t10 = pm3.*t6.*(1.0./2.0);
t11 = m3.*pm3.*t6;
t12 = a2.*m3.*t3;
t13 = m2.*pm2.*t3;
t14 = cos(t2);
t15 = cos(q3);
t16 = a1.*t15;
t17 = a1.*t15.*(1.0./2.0);
t18 = cos(t5);
t19 = a2.*t14;
t20 = pm3.*t18;
t21 = a2.*t14.*(1.0./2.0);
t22 = pm3.*t18.*(1.0./2.0);
t23 = m3.*pm3.*t18;
t24 = a2.*m3.*t14;
t25 = m2.*pm2.*t14;
t26 = a1.*t4;
t27 = a1.*t4.*(1.0./2.0);
t45 = pm2.*t3;
t28 = t26-t45;
t46 = pm2.*t3.*(1.0./2.0);
t29 = t27-t46;
t30 = Ma1_qw.*(1.0./2.0);
t31 = Ma1_wq.*(1.0./2.0);
t40 = pm2.*t14;
t32 = t16-t40;
t41 = pm2.*t14.*(1.0./2.0);
t33 = t17-t41;
t34 = -t16+t19+t20;
t35 = Ma3_w.*t34.*(1.0./2.0);
t36 = -t17+t21+t22;
t37 = Ma3_w.*t36;
t38 = t23+t24+t25+t30+t31+t35+t37-Ma2_w.*t32.*(1.0./2.0)-Ma2_w.*t33-Ma1_w.*pm1.*t15-a1.*m2.*t15-a1.*m3.*t15-m1.*pm1.*t15;
t39 = a1.^2;
t42 = -t26+t7+t8;
t43 = t10-t27+t9;
t44 = pm1.^2;
t47 = cos(q4);
t48 = a2.^2;
t49 = m3.*t48;
t50 = pm2.^2;
t51 = m2.*t50;
t52 = pm3.^2;
t53 = m3.*t52;
t54 = t21+t22;
t55 = t19+t20;
t56 = t10+t9;
t57 = t7+t8;
t58 = q4+q5;
t59 = cos(t58);
t60 = cos(q5);
t61 = a2.*m3.*pm3.*t60.*2.0;
t62 = Ma3_u.*t57.*(1.0./2.0);
t63 = Ma3_u.*t56;
t64 = Ma2_u.*pm2.*t3;
t65 = t11+t12+t13+t62+t63+t64;
t66 = Ma3_w.*t55.*(1.0./2.0);
t67 = Ma3_w.*t54;
t68 = Ma2_w.*pm2.*t14;
t69 = t23+t24+t25+t66+t67+t68;
t70 = Ma3_w.*t34.*t54;
t71 = Ma3_w.*t36.*t55;
t72 = Ma3_u.*t42.*t56;
t73 = Ma3_u.*t43.*t57;
t80 = a1.*m3.*pm3.*t59;
t74 = I2_zz+I3_zz+Ma2_q+Ma3_q+t49+t51+t53+t61+t70+t71+t72+t73-t80-a1.*a2.*m3.*t47-Ma2_w.*pm2.*t14.*t32.*(1.0./2.0)-Ma2_w.*pm2.*t14.*t33-Ma2_u.*pm2.*t28.*t3.*(1.0./2.0)-Ma2_u.*pm2.*t29.*t3-a1.*m2.*pm2.*t47;
t75 = a2.*m3.*pm3.*t60;
t76 = Ma3_u.*pm3.*t6;
t77 = t11+t76;
t78 = Ma3_w.*pm3.*t18;
t79 = t23+t78;
t81 = Ma3_w.*pm3.*t18.*t34.*(1.0./2.0);
t82 = Ma3_w.*pm3.*t18.*t36;
t83 = Ma3_u.*pm3.*t42.*t6.*(1.0./2.0);
t84 = Ma3_u.*pm3.*t43.*t6;
t85 = Ma3_u.*pm3.*t57.*t6.*(1.0./2.0);
t86 = Ma3_u.*pm3.*t56.*t6;
t87 = Ma3_w.*pm3.*t18.*t55.*(1.0./2.0);
t88 = Ma3_w.*pm3.*t18.*t54;
t89 = I3_zz+Ma3_q+t53+t75+t85+t86+t87+t88;
B = reshape([Ma1_u+Ma2_u+Ma3_u+m1+m2+m3,0.0,t11+t12+t13-Ma2_u.*t28.*(1.0./2.0)-Ma2_u.*t29+Ma3_u.*t42.*(1.0./2.0)+Ma3_u.*t43-Ma1_u.*pm1.*t4-a1.*m2.*t4-a1.*m3.*t4-m1.*pm1.*t4,t65,t77,0.0,Ma1_w+Ma2_w+Ma3_w+m1+m2+m3,t38,t69,t79,t11+t12+t13-Ma2_u.*t28.*(1.0./2.0)-Ma2_u.*t29+Ma3_u.*(t10+t9-a1.*t4.*(1.0./2.0))+Ma3_u.*(t7+t8-a1.*t4).*(1.0./2.0)-Ma1_u.*pm1.*t4-a1.*m2.*t4-a1.*m3.*t4-m1.*pm1.*t4,t38,I1_zz+I2_zz+I3_zz+Ma1_q+Ma2_q+Ma3_q+t49+t51+t53+t61+m1.*t44+m2.*t39+m3.*t39-Ma1_qw.*pm1.*t15-Ma1_wq.*pm1.*t15+Ma3_w.*t34.*t36.*2.0+Ma3_u.*t42.*t43.*2.0+Ma1_w.*t15.^2.*t44+Ma1_u.*t4.^2.*t44+Ma2_w.*(t16-t40).*(t17-t41).*2.0+Ma2_u.*(t26-t45).*(t27-t46).*2.0-a1.*a2.*m3.*t47.*2.0-a1.*m2.*pm2.*t47.*2.0-a1.*m3.*pm3.*t59.*2.0,t74,I3_zz+Ma3_q+t53+t75-t80+t81+t82+t83+t84,t65,t69,t74,I2_zz+I3_zz+Ma2_q+Ma3_q+t49+t51+t53+t61+Ma3_w.*t54.*t55.*2.0+Ma3_u.*t56.*t57.*2.0+Ma2_w.*t14.^2.*t50+Ma2_u.*t3.^2.*t50,t89,t77,t79,I3_zz+Ma3_q+t53+t75+t81+t82+t83+t84-a1.*m3.*pm3.*t59,t89,I3_zz+Ma3_q+t53+Ma3_w.*t18.^2.*t52+Ma3_u.*t52.*t6.^2],[5, 5]);
%#eml
end

