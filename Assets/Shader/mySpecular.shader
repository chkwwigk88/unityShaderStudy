Shader "Custom/mySpecular"
{
    Properties
    {
        _Shiniess("Shininess",Range(1,8)) = 4
    }
    SubShader
    {
        pass
        {
            Tags{"LightMode"="ShadowCaster"}
        }
        pass
        {
            Tags{"LightMode"="ForwardBase"}
            CGPROGRAM
            #define UNITY_SHADER_NO_UPGRADE 1
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityLightingCommon.cginc"
            #include "UnityCG.cginc"

            float _Shiniess;
            struct v2f
            {
                float4 pos:POSITION;
                float4 col:COLOR;
            };

            //struct v2f
            //{
            //    float4 pos:POSITION;
            //    float4 ver:POSITION1;
            //    float4 norl:POSITION2;
            //};


            v2f vert(appdata_base data)
            {
                v2f v;
                v.pos = mul(UNITY_MATRIX_MVP,data.vertex);
                //v.ver = data.vertex;
                //v.norl = float4( normalize(data.normal),0);



                float3 L = normalize(_WorldSpaceLightPos0);
                float3 N = mul(float4(data.normal,0),unity_WorldToObject).xyz;
                N = normalize(N);

                float dt = saturate(dot(N,L));
                float4 difuse_col = _LightColor0*dt + UNITY_LIGHTMODEL_AMBIENT;
                v.col = difuse_col;

                ////phong光照模型
                //float3 incident_light = -WorldSpaceLightDir(data.vertex);
                //float3 ref_light = reflect(incident_light,N);

                //float3 view_dir = WorldSpaceViewDir(data.vertex);
                //ref_light = normalize(ref_light);
                //view_dir = normalize(view_dir);

                //float3 coe = pow(saturate(dot(ref_light,view_dir)),_Shiniess);
                //v.col.rgb += _LightColor0*coe;


                //blinn phong光照模型
                //float3 V = WorldSpaceViewDir(data.vertex);
                //float3 I = WorldSpaceLightDir(data.vertex);
                //float3 H = normalize(normalize(L)+normalize(V));

                //float coe = pow(saturate(dot(N,H)),_Shiniess);
                //v.col.rgb+=_LightColor0*coe;

                return v;
            }

            float4 frag(v2f data):COLOR
            {
                //float4 col;
                //float3 L = normalize(_WorldSpaceLightPos0);
                //float3 N = mul(data.norl,unity_WorldToObject).xyz;
                //N = normalize(N);

                //float dt = saturate(dot(N,L));
                //float4 difuse_col = _LightColor0*dt + UNITY_LIGHTMODEL_AMBIENT;
                //col = difuse_col;

                ////phong光照模型
                //float3 incident_light = -WorldSpaceLightDir(data.ver);
                //float3 ref_light = reflect(incident_light,N);

                //float3 view_dir = WorldSpaceViewDir(data.ver);
                //ref_light = normalize(ref_light);
                //view_dir = normalize(view_dir);

                //float3 coe = pow(saturate(dot(ref_light,view_dir)),_Shiniess);
                //col.rgb += _LightColor0*coe;

                //return col;


                return data.col;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
