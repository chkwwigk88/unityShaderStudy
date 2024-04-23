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
                Diffuse[_Color]   //�������ʾ���屾��ķ���
                Ambient[_Ambient]
                Specular[_SpecularColor]
                Shininess[_Shininess]
                //Emission[_Emission]   //�Է���
            }

            Lighting on
            SeparateSpecular on
            
        }
    }
}
