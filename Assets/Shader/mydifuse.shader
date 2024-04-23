

Shader "Custom/mydifuse"
{
    SubShader
    {
        // pass
        //{
        //    Tags{"LightMode"="ShadowCaster"}
        //}
        pass
        {
            Tags{"LightMode" = "ForwardBase"}
            CGPROGRAM
            #define UNITY_SHADER_NO_UPGRADE 1
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityLightingCommon.cginc"
            #include "UnityCG.cginc"
            struct v2f
            {
                float4 pos:POSITION;
                //float3 nor:POSITION1;
                //float3 li:POSITION2;
                float3 col:COLOR;
            };

            v2f vert(appdata_base v)
            {
                v2f o;
                
                o.pos = mul(UNITY_MATRIX_MVP,v.vertex);


                float3 N = normalize(v.normal);
                float3 L = mul(unity_WorldToObject,_WorldSpaceLightPos0);

                //o.nor = N;
                //o.li = L;
                //L = normalize(_WorldSpaceLightPos0);
                //N = mul(float4(N,0),unity_WorldToObject).xyz;
                //N = normalize(N);

                float3 dv = saturate(dot(N,L));
                o.col = _LightColor0 * dv + UNITY_LIGHTMODEL_AMBIENT;

                //float3 lightcol = ShadeVertexLightsFull(v.vertex,v.normal,4,true);
                //o.col.rgb+=lightcol;
                return o;
            }

            float3 frag(v2f v):COLOR
            {
                //float3 L = mul(unity_WorldToObject,_WorldSpaceLightPos0);
                //float3 dv = saturate(dot(v.nor,L));
                //float3 co = _LightColor0 * dv + UNITY_LIGHTMODEL_AMBIENT;

                
                return v.col;
   
            }
            ENDCG
        }
    }

    fallBack "Diffuse"
}
