using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetFloat : MonoBehaviour
{
    private float dist = -1f;
    private float r = 0.1f;
    private Renderer rnd;
    // Start is called before the first frame update
    void Start()
    {
        rnd = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void Update()
    {
        // if (rnd != null)
        // {
        //     dist += Time.deltaTime;
        //     rnd.material.SetFloat("dist", dist);
        //     rnd.material.SetFloat("r", r);
        // }
    }

}
