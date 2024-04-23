Shader "Custom/fixedfun"
{
    Properties
    {
        _Color("Main Color",color) = (1,1,1,1)
        _Ambient("Ambient Color",color) = (0.3,0.3,0.3,0.3)
        _SpecularColor("Specular Color",color) = (1,1,1,1)
        _Shininess("Shininess Va",range(1,1000)) = 4
        //_Emission("Emission",color) = (1,1,1,1)
    }

    SubShader
    {
        Pass
        {
            Material
            {
                // color(1,0.2,1,1)
                Diffuse[_Color]   //漫反射表示物体本身的反射
                Ambient[_Ambient]
                Specular[_SpecularColor]
                Shininess[_Shininess]
                //Emission[_Emission]   //自发光
            }

            Lighting on
            SeparateSpecular on
            
        }
    }
}
