Shader "Custom/egdeLight"
{
    SubShader
    {
        Tags {"Queue"="Transparent"}
        pass
        {
            
            Blend SrcAlpha OneMinusSrcAlpha
            // Tags{"LightMode" = "ForwardBase"}
            CGPROGRAM
            #define UNITY_SHADER_NO_UPGRADE 1
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityLightingCommon.cginc"
            #include "UnityCG.cginc"
            struct v2f
            {
                float4 pos:POSITION;
                float3 normal:NORMAL;
                float4 vertex:POSITION1;
            };

            v2f vert(appdata_base v)
            {
                v2f o;
                
                o.pos = mul(UNITY_MATRIX_MVP,v.vertex);

                o.normal = v.normal;
                o.vertex = v.vertex;

                
                return o;
            }

            float4 frag(v2f v):COLOR
            {
                float3 nWorldPos = normalize(mul(v.normal,(float3x3)unity_WorldToObject));
                float3 vWorldPos = normalize(mul(unity_ObjectToWorld,v.vertex).xyz);
                float3 vcPos = _WorldSpaceCameraPos.xyz - vWorldPos;
                // float3 vcPos = _WorldSpaceLightPos0.xyz - vWorldPos;
                vcPos = normalize(vcPos);
                float dt = saturate(dot(nWorldPos,vcPos));

                dt = pow(1.0 - dt,2);

                float4 col = float4(1,1,1,1) * dt;
                return col;
            }
            ENDCG
        }
        
    }
}
